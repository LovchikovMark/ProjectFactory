require 'thor'
require 'dotenv/load'



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
    output = `node ~/MyProjects/ProjectFactory/dist/src/executeTemplate.js --template #{options[:template]} --directory #{options[:directory]}`
    puts output
  end

  desc "delete", "delete ProjectFactory"
  def delete
    output = `sudo bash ~/MyProjects/ProjectFactory/scripts/delete.sh`
    puts output
  end

  desc "restructure", "restructure project accrord new template with saving all files. "
  option :template, type: :string, aliases: "-t", desc: "Path to your new template"
  option :directory, type: :string, aliases: "-d", desc: "Path to your directory what you have restucture"
  def restructure
    output = `node ~/MyProjects/ProjectFactory/dist/src/restructureProject.js --template #{options[:template]} --directory #{options[:directory]}`
    puts output
  end
  
end

Cli.start(ARGV)