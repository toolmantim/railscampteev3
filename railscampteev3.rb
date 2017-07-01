ENV["TZ"] = "Australia/Sydney"

require 'rubygems'
require 'sinatra'

get '/' do
  if ((@days_left = Date.civil(2017,7,15) - Date.today) < 0)
    haml :closed
  else
    haml :home
  end
end

get '/thankyou' do
  haml :thankyou
end

__END__

@@ layout
!!! Strict
%html
  / Cufon, Sinatra and Heroku FTW!
  %head
    %meta{:charset => "utf-8"}
    %title Rails camp tee v3
    %script{:src => "jquery.js", :type => "text/javascript"}
    %script{:src => "cufon.js", :type => "text/javascript"}
    %script{:src => "fontin.font.js", :type => "text/javascript"}
    %script{:src => "scripty.js", :type => "text/javascript"}
    :javascript
      Cufon.replace("h1, p.days, .guy-or-gal, h1.name, p.description, .thankyou h1");
    %link{:rel => "stylesheet", :href => "styles.css"}
  %body
    = yield

    :javascript
      Cufon.now();

@@ closed

%img.tee{:src => "tee.gif", :alt => "Tee", :width => "434", :height => "320"}/

.closed
  %h1 All done.
  %p
    <strong>sorry oh my sorry</strong>, if you haven&rsquo;t ordered yet
    you&rsquo;ve missed out. For now you can pick up an old school railscamp
    tee from <a href="http://railscamptee.com/">railscamptee.com</a>.

  %p See you all at <a href="http://railscamps.com/#au_may_2009">rails camp</a>!

@@ home

%img.tee{:src => "tee.gif", :alt => "Tee", :width => "434", :height => "320"}/

%h1.order Order.
%p.days
  - if @days_left > 0
    == only #{(@days_left + 1).to_i} days left
  - elsif @days_left == 0
    last day!

.intro
  %p
    <strong>yes oh my yes</strong>, it&rsquo;s the third version of the rails camp tee, exclusive to <a
    href="http://railscamps.com/#au_may_2009">gold coast railscampians</a>.
    Order now for $20 and pick it up at Railscamp.
  %p
    Not going to rails camp but know someone who is? Order a tee and get them
    to pick it up for you.
  %p
    All profits (~ $8 per tee) go to <a
    href="http://www.ewb.org.au/">Engineers&nbsp;Without&nbsp;Borders
    Australia</a>.
  %p
    \\m/ to <a href="http://carlahackett.com/">Carla Hackett</a> for yet
    another rad design, and Nathan Wong from bestylin for the tee printing.

.guy-or-gal
  %h1.gal gals
  %span.or or
  %h1.guy guys
  %span.question ?

.guy-tee-sizes
  .small
    %img{:src => "tee-white.png", :alt => "The Tee"}/
    %span.size S
  .medium
    %img{:src => "tee-white.png", :alt => "The Tee"}/
    %span.size M
  .large
    %img{:src => "tee-white.png", :alt => "The Tee"}/
    %span.size L
  .x-large
    %img{:src => "tee-white.png", :alt => "The Tee"}/
    %span.size XL

  %table
    %thead
      %tr
        %th{:scope => "row"} Measurements
        %th{:scope => "col"} S
        %th{:scope => "col"} M
        %th{:scope => "col"} L
        %th{:scope => "col"} XL
    %tbody
      %tr
        %th{:scope => "row"} Body Width (cm)
        %td 45
        %td 49
        %td 53
        %td 57
      %tr
        %th{:scope => "row"} Body Length (cm)
        %td 70
        %td 73
        %td 75
        %td 78

.gal-tee-sizes
  .small
    %img{:src => "tee-white-gal.png", :alt => "The Tee"}/
    %span.size S
  .medium
    %img{:src => "tee-white-gal.png", :alt => "The Tee"}/
    %span.size M
  .large
    %img{:src => "tee-white-gal.png", :alt => "The Tee"}/
    %span.size L
  .x-large
    %img{:src => "tee-white-gal.png", :alt => "The Tee"}/
    %span.size XL

  %table
    %thead
      %tr
        %th{:scope => "row"} Measurements
        %th{:scope => "col"} S
        %th{:scope => "col"} M
        %th{:scope => "col"} L
        %th{:scope => "col"} XL
    %tbody
      %tr
        %th{:scope => "row"} Body Width (cm)
        %td 43
        %td 45.5
        %td 48
        %td 51.75
      %tr
        %th{:scope => "row"} Body Length (cm)
        %td 66
        %td 67
        %td 68
        %td 69

.details
  %form{:method => "post", :action => ""}
    %h1.name Name?
    %input.name{:type => "text"}/
    %input.submit{:type => "submit", :value => "→"}/
    %p.description so we know who to give it to...

.pay
  %h1 xyz
  %form{:action=>"thankyou.html", :method => "get"}
    %input{:type => "image", :src => "https://www.paypal.com/en_AU/i/btn/btn_buynowCC_LG.gif", :name => "submit", :alt => "Pay with PayPal"}/

@@ thankyou
%img.tee{:src => "tee.gif", :alt => "Tee", :width => "434", :height => "320"}/

.thankyou
  %h1 Rockn!
  %p I (Tim Lucas) will see you at Railscamp, tee in hand.
  %p
    Feel free to
    %a{:href => "index.html"} grab a couple for your friends
    too!