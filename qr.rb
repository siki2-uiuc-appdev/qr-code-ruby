require "rqrcode"


def create_png(qrcode)
  puts "What would you like to call the PNG?"
  png_name = gets.chomp
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("#{png_name}.png", png.to_s)
end

while true

  puts "What kind of QR code would you like to generate?"
  print "
  1. Open a URL
  2. Join a wifi network
  3. Send a text message
  4. Exit program\n
  "

  user_input = gets.chomp.to_i

  case user_input

  when 1
    puts "What is the URL you would like to encode?"
    url = gets.chomp
    qrcode = RQRCode::QRCode.new(url)
    create_png(qrcode)
   
  when 2
    puts "What is the name of the wifi network?"
    network_name = gets.chomp
    puts "What is the password?"
    pass = gets.chomp
    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_name};P:#{pass};;")
    create_png(qrcode)

  when 3
    puts "What is the phone number you want the code to send a text message to?"
    phone_number = gets.chomp
    puts "What do you want to populate the message with?"
    text_message = gets.chomp
    qrcode = RQRCode::QRCode.new("SMSTO:#{phone_number}: #{text_message}")
    create_png(qrcode)
  
  when 4
    break

  else
    print "\n"
    puts "Didn't recognize that selection. Please try again."
    print "\n"
  end
  
end
