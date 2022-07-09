module Enumerable
  # Your code goes here

	def my_each_with_index
		if block_given?
			i = 0
      		for el in self
        	yield el, i
        	i += 1
			end
      		return self
    	end
  	end

	def my_select
		arr = Array.new
    	if block_given?
			my_each {|el| arr << el if yield(el)}
			return arr
		else
			return self
		end
	end

	def my_all?
		if block_given?
			result = true
			my_each {|el| result = false if yield(el) == false}
			return result
		else
			return self
		end
	end

	def my_any?
		if block_given?
			result = false
			my_each {|el| result = true if yield(el) == true}
			return result
		else
			return self
		end
	end

	def my_none?
		if block_given?
			result = true
			my_each {|el| result = false if yield(el) == true}
			return result
		else
			return self
		end
	end

	def my_count
		return size unless block_given?
		count = 0
		my_each {|el| count += 1 if yield el }
		count
	end

	def my_map
		return array unless block_given?
		arr = Array.new
		my_each {|el| arr << yield(el)}
		return arr
	end

	def my_inject(x = 0)
		if block_given?
			i = x
			my_each {|el| i = yield(i, el)}
			return i
		else
			return self
		end
	end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
	def my_each
		if block_given?
			for el in self
        		yield el
			end
      		return self
    	end
  	end
end

# bundle exec rspec spec/my_inject_spec.rb