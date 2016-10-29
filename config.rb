css_dir = "css"
sass_dir = "scss"
images_dir = "img"
javascripts_dir = "js"
fonts_dir = "fonts"

output_style = :expanded
line_comments = false
color_output = false  

require 'fileutils'
on_stylesheet_saved do |file|
  if file.match('.min') == nil
    require 'compass'
    require 'susy' 

    Compass.add_configuration(
        {
            :output_style => :compressed
        },
        'min'
    )
    Compass.compiler.compile('scss/screen.scss', 'css/screen.min.css')
  end
end
