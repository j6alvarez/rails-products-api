# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'faker'
require 'factory_bot'


  FactoryBot.create_list(:user,3)

  FactoryBot.create_list(:product,20)


