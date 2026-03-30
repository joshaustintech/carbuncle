# frozen_string_literal: true

require 'logger'

def render_with_logs(logger, width, height)
  puts "P3\n #{width} #{height}\n65535"
  (0...height).each do |y|
    logger.info "Scanlines remaining: #{height - y}" if (y % 128).zero?
    (0...width).each do |x|
      r = x.to_f / (width - 1)
      g = y.to_f / (height - 1)
      b = 0.0
      puts "#{(65_534.999 * r).to_i} #{(65_534.999 * g).to_i} #{(65_534.999 * b).to_i}"
    end
  end
end

def measure_with_logs(method_name, logger, *args)
  start_time = Process.clock_gettime Process::CLOCK_MONOTONIC
  send(method_name, logger, *args)
  end_time = Process.clock_gettime Process::CLOCK_MONOTONIC
  elapsed = end_time - start_time
  logger.info "Function `#{method_name}` took #{elapsed} seconds."
end

def main
  logger = Logger.new $stderr
  measure_with_logs(:render_with_logs, logger, 512, 512)
end

main
