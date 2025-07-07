require 'thor'

class Cli < Thor

  desc "create", "create project accord template"
  option :template, type: :string, aliases: "-t", desc: "Path to your template"
  option :directory, type: :string, aliases: "-d", desc: "Path to your directory"
  option :git, type: :string, aliases: "-g", desc: "Link to your remote github repo"

  def create
    if !options[:git].nil?
      if options[:directory].nil?
        `git init #{Dir.pwd()} && git remote add origin #{options[:git]}`
      elsif !options[:directory].nil?
        `git init #{options[:directory]} && cd #{options[:directory]} && git remote add origin #{options[:git]}`
      end
    end
    output = `node /usr/local/src/ProjectFactory/dist/executeTemplate.js --template #{options[:template]} --directory #{options[:directory]}`
    puts output
  end

  desc "delete", "delete ProjectFactory"

  def delete
    output = `sudo bash /usr/local/src/ProjectFactory/scripts/delete.sh`
    puts output
  end
  
end

Cli.start(ARGV)