require "rqrcode"

# qrcode = RQRCode::QRCode.new("SMSTO:(555) 555-5555: Hi Alice!")

# png = qrcode.as_png({ :size => 500})

# IO.binwrite("sometext.png", png.to_s)

while true
  puts "What kind of QR code would you like to generate?"
  print "
  1. Open a URL
  2. Join a wifi network
  3. Send a tesxt message
  4. Exit program\n
  "

  user_input = gets.chomp.to_i

  case user_input

  when 1
    puts "What is the URL you would like to encode?"
    url = gets.chomp
    puts "What would you like to call the PNG?"
    png_name = gets.chomp
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{png_name}.png", png.to_s)
    # break
  when 2
    puts "What is the name of the wifi network?"
    network_name = gets.chomp
    puts "What is the password?"
    pass = gets.chomp
    puts "What would you like to call the PNG?"
    png_name = gets.chomp
    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{network_name};P:#{pass};;")
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{png_name}.png", png.to_s)
    # break
  when 3
    puts "What is the phone number you want the code to send a text message to?"
    phone_number = gets.chomp
    puts "What do you want to populate the message with?"
    text_message = gets.chomp
    puts "What would you like to call the PNG?"
    png_name = gets.chomp
    qrcode = RQRCode::QRCode.new("SMSTO:#{phone_number}: #{text_message}")
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{png_name}.png", png.to_s)
    # break
  when 4
    break
  else
    p "Didn't recognize that selection. Please try again."
  end
  
end

# def create_qr_code(

# )
