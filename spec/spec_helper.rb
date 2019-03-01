require 'minitest/autorun'
require 'minitest/reporters'
#require './lib/**/*rb'
Dir["./lib/*.rb"].each { |file| require file }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
