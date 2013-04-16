require 'active_support/callbacks'

class Ca
	include ActiveSupport::Callbacks
	define_callbacks :save
	set_callback :save, :before_save
	set_callback :save, :after, :after_save
	set_callback :save, :around, :around_save

	def save
		run_callbacks :save do
			puts 'saving ...'
		end
	end

	def before_save
		puts 'before save'
	end

	def after_save
		puts 'areadly saved'
	end

	def around_save
		puts 'around save - begining'
		yield
		puts 'around save - end'
	end
end

oa = Ca.new
oa.save