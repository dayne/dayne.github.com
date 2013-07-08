require 'highline/import'
require 'colored'
require 'yaml'

config = YAML.load_file("_config.yml")

desc "default list out tasks"
task :default do
  system("rake -T")
end

# rake post["Post title"]
desc "Create a post in _posts"
task :post, :title do |t, args|
  title     = args[:title]
  template  = config["post"]["template"]
  extension = config["post"]["extension"]
  editor    = config["editor"]

  if title.nil? or title.empty?
    title = ask("title for this post: ")
  end

  if agree("Want to manually set the date?")
    date = ask("What date do you want to use (YYYY/MM/DD) : ", Date)
  else
    puts "setting time to now".blue
    date = Time.now.strftime('%F')
  end

  filename = "#{date}-#{title.gsub(/(\'|\!|\?|\:|\s\z)/,"").gsub(/\s/,"-").downcase}.#{extension}"
  content  = File.read(template)

  if File.exists?("_posts/#{filename}")
    raise "The post already exists."
  else
    parsed_content = "#{content.sub("title:", "title: \"#{title}\"")}"
    File.write("_posts/#{filename}", parsed_content)
    puts "#{filename} was created."

    if editor && !editor.nil?
      sleep 2
      system "#{editor} _posts/#{filename}"
    end
  end
end
