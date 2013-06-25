require 'nokogiri'
require 'logger'

module CacheDoctor

  class Middleware
    def initialize(app, message = 'CacheDoctor')
      @app = app
      @message = message
      @logger = Logger.new(STDOUT)
      @logger.formatter = proc do |severity, datetime, progname, msg|
        "[CacheDoctor] #{msg}\n"
      end
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      @status, @headers, @response = @app.call(env)
      if @headers['Content-Type'] && @headers['Content-Type'].include?('text/html')
        start = Time.now
        html = Nokogiri::HTML(@response.body)
        if env['warden'].user
          html.css('body .hidden-signed-in, body .visible-signed-out').remove
        else
          html.css('body .visible-signed-in, body .hidden-signed-out').remove
        end
        @response.body = html.to_s
        stop = Time.now
        @logger.debug "altered cache (#{((stop - start) * 1000).round(1)}ms)"
      end
      [@status, @headers, self]
    end

    def each(&block)
      @response.each(&block)
    end
  end

  module Rails
    class Engine < ::Rails::Engine
      initializer 'cache_doctor.use_middleware' do |app|
        app.middleware.use CacheDoctor::Middleware
      end
    end
  end

end
