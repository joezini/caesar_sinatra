
def caesar_cipher(input, shift)
	output = ""
	input.each_byte do |b|
		output << cycle_char(b, shift).chr
	end
	output
end

def cycle_char(char_number, shift)
	shifted = char_number + shift
	if char_number >= 97 && char_number <= 122
		# lower case
		if shifted > 122
			shifted = shifted - 123 + 97
		end
		return shifted
	elsif char_number >= 65 && char_number <= 90
		# upper case
		if shifted > 90
			shifted = shifted - 91 + 65
		end
		return shifted
	else
		# symbol
		return char_number
	end
end

#caesar_cipher("What a string!", 5)


