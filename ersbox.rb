#!/usr/bin/env ruby

=begin

    CMR Project

=end

###########################
##  BASIC CONFIGURATION  ##
###########################


# Default -> false
$pb_log_enabled = false
$pb_log_file = File.dirname(__FILE__) + "/other/log/ErsBox_log_" + ENV['USER'] + ".log"

# Default -> true
$protected_mode = true

# $text_color variable.
# When true, titles and warnings will be colorful,
# else it will be with default colors.
#
# Default -> true
$text_color = true

###########################

##### Loading time
dir = File.dirname(__FILE__)
require dir + "/lib/pb_proced_lib.rb" # Common procedures and functions.

version = "1"
Signal.trap("INT") do
	puts ""
	puts "[*] EXITING ..."
	puts ""
	pb_write_log("exiting", "Core")
	exit
end
#####

pb_write_log("ErsBox loaded", "Core")

srand(Time.now.to_i)
banner = rand(4)

puts ""
title " ErsBox #{version} "

# Thanks to Cowsay for the ASCII Art ;-)
case banner
	when 0
		
		puts "    _______      _           _     _ ________              "
		puts "   |  _____|    | | |     | | |   | |        |             "
		puts "   |  |         | |   | |   | |   | |________|             "
		puts "   |  |____     | |    |    | |   | | ||                   "
		puts "   |_______|    |_|         |_|   |_|   ||                 "         
	when 1
		puts "    _______      _           _     _ ________              "
		puts "   |  _____|    | | |     | | |   | |        |             "
		puts "   |  |         | |   | |   | |   | |________|             "
		puts "   |  |____     | |    |    | |   | | ||                   "
		puts "   |_______|    |_|         |_|   |_|   ||                 "  
	when 2
		puts "    _______      _           _     _ ________              "
		puts "   |  _____|    | | |     | | |   | |        |             "
		puts "   |  |         | |   | |   | |   | |________|             "
		puts "   |  |____     | |    |    | |   | | ||                   "
		puts "   |_______|    |_|         |_|   |_|   ||                 "  
	when 3
		# This banner is thanks to figlet.
		puts "    _______      _           _     _ ________              "
		puts "   |  _____|    | | |     | | |   | |        |             "
		puts "   |  |         | |   | |   | |   | |________|             "
		puts "   |  |____     | |    |    | |   | | ||                   "
		puts "   |_______|    |_|         |_|   |_|   ||                 "  
end

sleep(0.25)
option1 = ""

while option1 != "5"
	module_exec = true
	puts ""
	puts "--------- Menu" + " "*10 + "ruby#{RUBY_VERSION} @ #{RUBY_PLATFORM}"
	puts ""
	
	puts ""
	puts "1- Network tools"
	
        puts ""
        
	puts ""
	puts "5- Exit"
	puts ""
	print "   -> "
	option1 = gets_pb.chomp
	puts ""

	case option1
		
		when "1"
			
			puts "1- Honeypot"
			
			puts ""
			puts "0- Back"
			puts ""
			print "   -> "
			option2 = gets_pb.chomp
			case option2
				when "0"
					module_exec = false
				
				
				when "1"
					require "#{dir}/tools/network/honeypot.rb"
					Network_pb::Honeypot_pb.new()
				
				else
					module_exec = false
					puts ""
					puts "Invalid option."
					puts ""
			end
		
		when "4"
module_exec = false
puts "
    CMR Project

"
		when "5"
			module_exec = false
			Process.kill("SIGINT", Process.pid()) # Just exit.
		else
			module_exec = false
			puts ""
			puts "Invalid option."
			puts ""
	end
	if module_exec == true
		puts ""
		puts "[*] Module execution finished."
		puts ""
	end
end

