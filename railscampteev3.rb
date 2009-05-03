require 'rubygems'
require 'sinatra'

get '/' do
  haml :home
end

get '/thankyou' do
  haml :thankyou
end

__END__

@@ layout
!!! Strict
%html
  %head
    %title Rails camp tee v3
    %script{:src => "/cufon.js", :type => "text/javascript"}
    %script{:src => "/fontin.font.js", :type => "text/javascript"}
    %script{:src => "/jquery.js", :type => "text/javascript"}
    %script{:src => "/scripty.js", :type => "text/javascript"}
    
    :javascript
      Cufon.replace("h1, p.days, .guy-or-gal, h1.name, p.description, .thankyou h1");
      
    %style{:type => "text/css", :media => "all"}
      :sass
        html, body, div, h1, h2, p
          :margin 0
          :padding 0
          :font-size 100%
          
        body
          :width 900px
          :margin 0 auto
          :background-color #ff0
          :position relative
          :font-family Arial, sans-serif
      
        a
          :text-decoration none
          :border-bottom 1px solid black
          :color black
      
        img.tee
          :position absolute
          :top 100px
          :left 0
        h1.order
          :z-index 4
          :position absolute
          :top 150px
          :left 500px
          :font-size 100px
          :text-transform lowercase
          :cursor pointer
        p.days
          :position absolute
          :top 260px
          :left 720px
          :font-size 24px
          :text-transform lowercase
          :color red
        p.intro
          :position absolute
          :top 350px
          :left 500px
          :font-size 14px
          :width 420px
          :line-height 1.5em
          
        .guy-or-gal
          :z-index 3
          :position absolute
          :bottom 500px
          :left 500px
          *
            :position absolute
          h1
            :font-size 90px
            :cursor pointer
          h1.gal
            :top 0
            :left 0
          .or
            :top 80px
            :left 65px
            :font-size 40px
            :color red
          h1.guy
            :top 60px
            :left 110px
          .question
            :top 100px
            :left 285px
            :font-size 50px
            :color red
            
        .guy-tee-sizes, .gal-tee-sizes
          :opacity 0
          :display none
          :top 130px
          :left 400px
          :position absolute
          div
            :z-index 2
            :position absolute
            :left 0
            :text-align center
            :font-weight bold
            :color black
            :cursor pointer
            img
              :width 100%
              :margin-bottom 5px
            &.small
              :top 50px
              :width 85px
            &.medium
              :top 40px
              :width 106px
            &.large
              :top 27px
              :width 131px
            &.x-large
              :top 0
              :width 171px
        
        .details
          :z-index 1
          :opacity 0
          :display none
          :position absolute
          :top 150px
          :left 400px
          h1.name
            :font-size 48px
          p.description
            :font-size 18px
            :opacity 0.5
          input
            :font-size 24px
          input.submit
            :background-color #000
            :color #fff
            :border none
            
        .pay
          :z-index 1
          :position absolute
          :top 170px
          :left 550px
          :opacity 0
          :display none
          h1
            :font-size 24px
            :margin 0
            :padding 0
          form
            :margin 20px 0 0 10px

        .thankyou
          :position absolute
          :top 100px
          :left 500px
          h1
            :font-size 92px
            :position absolute
            :top 0
            :left 0
          p
            :margin-top 10px
  %body
    = yield
    :javascript
      Cufon.now();

@@ home

%img.tee{:src => "/tee.gif", :alt => "Tee", :width => "434", :height => "320"}/
%h1.order Order.
%p.days only 7 days left.
%p.intro
  <strong>yes oh my yes</strong>, it&rsquo;s third version of the railscamp tee, exclusive to railscampians. Order now for $20 and pick it up at Railscamp. All profits will be donated to <a href="http://www.ewb.org.au/">Engineers&nbsp;Without&nbsp;Borders Australia</a>. Do&nbsp;it.
  %br/
  %br/
  \\m/ to <a href="http://hellotherecanary.com/">Carla Hackett</a> for yet another rad design.

.guy-or-gal
  %h1.gal gals
  %span.or or
  %h1.guy guys
  %span.question ?

.guy-tee-sizes
  .small
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    S
  .medium
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    M
  .large
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    L
  .x-large
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    XL

.gal-tee-sizes
  .small
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    S
  .medium
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    M
  .large
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    L
  .x-large
    %img{:src => "/tee-white.png", :alt => "The Tee"}/
    XL

    
.details
  %form{:method => "post", :action => ""}
    %h1.name Name?
    %input.name{:type => "text"}/
    %input.submit{:type => "submit", :value => "&rarr;"}/ 
    %p.description so we know who to give it to...
    
.pay
  %h1 xyz
  %form{:action=>"https://www.paypal.com/cgi-bin/webscr", :method => "post"}
    %input{:type => "hidden", :name => "cmd", :value => "_s-xclick"}/
    %input.details{:type => "hidden", :name => "item_name", :value => ""}/
    %input{:type => "hidden", :name => "return", :value => "http://railscampteev3.agencyrainford.com/thankyou"}/
    %input{:type => "hidden", :name => "encrypted", :value => "-----BEGIN PKCS7-----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-----END PKCS7-----"}/
    %input{:type => "image", :src => "https://www.paypal.com/en_AU/i/btn/btn_buynowCC_LG.gif", :name => "submit", :alt => "Pay with PayPal"}/
    
@@ thankyou
%img.tee{:src => "/tee.gif", :alt => "Tee", :width => "434", :height => "320"}/

.thankyou
  %h1 Rockn!
  %p See you at Railscamp, tee in hand.
  %p
    %a{:href => "/"} Grab another one?