require 'thor'
require 'open3'

class Cli < Thor
  desc "create", "create project accord template"
  option :template, type: :string, aliases: "-t", desc: "Path to your template"
  option :directory, type: :string, aliases: "-d", desc: "Path to your directory"
  option :git, type: :string, aliases: "-g", desc: "Link to your remote github repo"
  def create
    output = `node ~/MyProjects/ProjectFactory/dist/executeTemplate.js --template #{options[:template]} --directory #{options[:directory]}`
    puts output
  end
end

Cli.start(ARGV)