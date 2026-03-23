# config/initializers/logger_patch.rb

# Ruby 3.2 で Rails 6 の Logger が壊れる問題の完全修正パッチ
module ActiveSupport
  module LoggerThreadSafeLevel
    def self.included(base)
      base.class_eval do
        # Ruby 3.2 では local_level が削除されているためダミー実装を提供
        def local_level
          @local_level
        end

        def local_level=(level)
          @local_level = level
        end
      end
    end
  end
end
