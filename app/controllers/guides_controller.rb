class GuidesController < ApplicationController
   def book
       @books = ['fountainhead', 'railsbook', 'selfhelp']
   end
end