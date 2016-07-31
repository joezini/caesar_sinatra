require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar'

@@first_load = true

get '/' do
	message = params['message']
	shift = params['shift']
	if is_number(shift)
		encoded_message = caesar_cipher(message, shift.to_i)
	elsif @@first_load
		encoded_message = "Please enter a message and the number of letters to shift by"
	else
		encoded_message = "Shift must be a number"
	end
	@@first_load = false
	erb :index, :locals => {encoded_message: encoded_message}
end

def is_number(string)
	!(/^[0-9]+$/.match(string).nil?)
end