
Pod::Spec.new do |spec|
  spec.name         = "TicketKit"
  spec.version      = "1.0.0"
  spec.summary      = "The TicketKit is customizable widget that written in Swift"
  spec.description  = <<-DESC
			TicketKit is a framework that using as a MovieTicket or Coupon
                   DESC
  spec.homepage     = "https://appcoda.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Tolga Iskender" => "tolgaiskenderr@gmail.com" }
  spec.platform     = :ios, "11.3"
  spec.source       = { :git => "https://github.com/tiskender2/TicketKit.git", :tag => "#{spec.version}" }
  spec.source_files = "TicketKit"
  spec.swift_version = "4.2"
end