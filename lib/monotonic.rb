# frozen_string_literal: true

require "monotonic/version"

module Monotonic
  extend self

  def on_jruby?
    RUBY_PLATFORM == "java"
  end

  case
  when defined? Process::CLOCK_MONOTONIC
    def monotonic
      Process.clock_gettime Process::CLOCK_MONOTONIC
    end
    alias_method :now, :monotonic
  when on_jruby?
    def jruby
      java.lang.System.nanoTime() / 1.0e9
    end
    alias_method :now, :jruby
  else
    def time
      mutex = Mutex.new
      last_time = Time.now.to_f
      now = Time.now.to_f
      mutex.synchronize { last_time < now ? now : last_time + 1e-6 }
    end
    alias_method :now, :time
  end
end
