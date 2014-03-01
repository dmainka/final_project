# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


all_customer_data = [
  { :name => "Daniel Mainka", :email => "dmainka@gmail.com", :password => "password",  :password_confirmation => "password", :admin => true},
  { :name => "Customer1", :email => "customer1@example.com", :password => "password",  :password_confirmation => "password", :admin => false},
  { :name => "Customer2", :email => "customer2@example.com", :password => "password",  :password_confirmation => "password", :admin => false}
]

Customer.destroy_all
all_customer_data.each do |customer_info|
  c = Customer.new
  c.name = customer_info[:name]
  c.email = customer_info[:email]
  c.password = customer_info[:password]
  c.password_confirmation = customer_info[:password_confirmation]
  c.admin = customer_info[:admin]
  c.save
end

all_vendor_data = [
  { :name => "Vendor1" },
  { :name => "Vendor2" },
  { :name => "Vendor3" },
  { :name => "Vendor4" },
]

Vendor.destroy_all
all_vendor_data.each do |vendor_info|
  v = Vendor.new
  v.name = vendor_info[:name]
  v.save
end

all_department_data = [ { :name => "Books" }, { :name => "Music" }]
Department.destroy_all
all_department_data.each do |department_info|
  d = Department.new
  d.name = department_info[:name]
  d.save
end


all_product_data = [
  { :vendor_id => Vendor.find_by(name:'Vendor1').id,
    :department_id => Department.find_by(name:'Books').id,
    :name => "Ruby on Rails Tutorial",
    :description => "Using Rails, developers can build web applications of exceptional elegance and power. Although its remarkable capabilities have made Ruby on Rails one of the world’s most popular web development frameworks, it can be challenging to learn and use. Ruby on Rails™ Tutorial, Second Edition, is the solution. Best-selling author and leading Rails developer Michael Hartl teaches Rails by guiding you through the development of your own complete sample application using the latest techniques in Rails web development. The updates to this edition include all-new site design using Twitter’s Bootstrap; coverage of the new asset pipeline, including Sprockets and Sass; behavior-driven development (BDD) with Capybara and RSpec; better automated testing with Guard and Spork; roll your own authentication with has_secure_password; and an introduction to Gherkin and Cucumber.",
    :price => 27.00,
    :picture_url => "http://ecx.images-amazon.com/images/I/515MC8lePYL._SL160_PIsitb-sticker-arrow-dp,TopRight,12,-18_SH30_OU01_AA160_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor2').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "Agile Web Development with Rails 4 (Pragmatic Programmers)",
    :description => "Rails just keeps on changing. Both Rails 3 and 4, as well as Ruby 1.9 and 2.0, bring hundreds of improvements, including new APIs and substantial performance enhancements. The fourth edition of this award-winning classic has been reorganized and refocused so it's more useful than ever before for developers new to Ruby and Rails.",
    :price => 29.00,
    :picture_url => "http://ecx.images-amazon.com/images/I/41nToGax%2BRL._SX258_BO1,204,203,200_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor2').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "Practical Object-Oriented Design in Ruby: An Agile Primer",
    :description => "Ruby’s widely admired ease of use has a downside: Too many Ruby and Rails applications have been created without concern for their long-term maintenance or evolution. The Web is awash in Ruby code that is now virtually impossible to change or extend. This text helps you solve that problem by using powerful real-world object-oriented design techniques, which it thoroughly explains using simple and practical Ruby examples.",
    :price => 32.99,
    :picture_url => "http://ecx.images-amazon.com/images/I/51lFbn3LPCL._BO2,204,203,200_PIsitb-sticker-v3-big,TopRight,0,-55_SX278_SY278_PIkin4,BottomRight,1,22_AA300_SH20_OU01_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor3').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "The Rapid Rubyist",
    :description => "The Rapid Rubyist is a step by step guide that uses simple examples to teach Ruby. Each example has a brief description and then code examples to teach the concept. Many books focus on giving verbose explanations that try to give every detail possible, The Rapid Rubyist is different in that it tries to be concise, giving you all the information you need in a small package.

The Rapid Rubyist gets you writing code fast and gives you a reference you can come back to later when you need to remember how something works. It covers everything from the basics like strings and arrays to everyone's favorite topic: meta-programming!",
    :price => 4.99,
    :picture_url => "http://ecx.images-amazon.com/images/I/51emyV0F1FL._BO2,204,203,200_PIsitb-sticker-v3-big,TopRight,0,-55_SX278_SY278_PIkin4,BottomRight,1,22_AA300_SH20_OU01_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor4').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "Ruby on Rails 4.0 Guide",
    :description => "A step by step guide to learn Ruby on Rails 4.0. It includes a basic Ruby 2.0 tutorial and is written for programmers who know at least one other programming language and are familiar with HTML.  Topics: How to install a development system on Linux/Windows/Mac OS X, Ruby Basics, First Steps with Rails, ActiveRecord, Scaffolding, REST, Routes, Tests, Cookies and Sessions, Action Mailer, Internationalization, Bundler and Gems, Asset Pipeline, JavaScript, Caching, How to setup a production webserver on Linux, Scaffold Controller Template, Model Template, Forms.  Hands on code examples show how problems are solved. The reader can dive into a specific topic without having to run through a gigantic first to last page project.",
    :price => 32.99,
    :picture_url => "http://ecx.images-amazon.com/images/I/51CJg3LarTL._BO2,204,203,200_PIsitb-sticker-v3-big,TopRight,0,-55_SX278_SY278_PIkin4,BottomRight,1,22_AA300_SH20_OU01_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor4').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "The Ruby Programming Language",
    :description => "The Ruby Programming Language is the authoritative guide to Ruby and provides comprehensive coverage of versions 1.8 and 1.9 of the language. It was written (and illustrated!) by an all-star team",
    :price => 32.99,
    :picture_url => "http://ecx.images-amazon.com/images/I/51c3tL7dShL._BO2,204,203,200_PIsitb-sticker-v3-big,TopRight,0,-55_SX278_SY278_PIkin4,BottomRight,1,22_AA300_SH20_OU01_.jpg"
    },
  { :vendor_id => Vendor.find_by(name:'Vendor1').id,
    :department_id => Department.find_by(name:'Books'),
    :name => "Beginning Rails 4 (The Expert's Voice in Web Development)",
    :description => "Beginning Rails 4 is a book that will guide you from never having programmed with Ruby, to having a Rails application built and deployed to the web. You’ll learn how to combine all the components of Rails to develop your own web applications. You will use test driven development to make sure your application works exactly like you expect.  You will learn how to use Git for source control and best practice techniques to create applications like a pro. Essential, and often-missed, information on testing and learning to program with Ruby are also covered.  This book is well suited for someone with little to no Ruby or Rails experience, or possibly even someone with no experience developing web applications at all. Beginning Rails 4 does assume a basic familiarity with the web and typical web terms, but doesn’t require you to be an expert of these. This book will springboard your journey into web application development, and show you how much fun building web applications with Ruby on Rails can be.",
    :price => 32.99,
    :picture_url => "http://ecx.images-amazon.com/images/I/51JWihJrnDL._BO2,204,203,200_PIsitb-sticker-v3-big,TopRight,0,-55_SX278_SY278_PIkin4,BottomRight,1,22_AA300_SH20_OU01_.jpg"
    },


]

Product.destroy_all
all_product_data.each do |product_info|
  p = Product.new
  p.vendor_id = product_info[:vendor_id]
  p.department_id = product_info[:department_id]
  p.name = product_info[:name]
  p.description = product_info[:description]
  p.price = product_info[:price]
  p.picture_url = product_info[:picture_url]
  p.save
end

