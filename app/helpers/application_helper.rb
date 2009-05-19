<<<<<<< HEAD:app/helpers/application_helper.rb
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
end
=======
module ApplicationHelper

  # Title helper as described in RailsCast 30 (http://asciicasts.com/episodes/30-pretty-page-title)
  # Use as <%= :title "Page title" %> in your templates.
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Slogan helper: similar to the title helper. Puts a witty slogan on the current page.
  # Use as <%= :slogan "Plagiarism is bad for your grade" %> in your templates.
  def slogan(page_slogan)
    content_for(:slogan) { page_slogan }
  end
end
>>>>>>> 336471e6be257cf55c9afa2a65f928fde34e41fe:app/helpers/application_helper.rb
