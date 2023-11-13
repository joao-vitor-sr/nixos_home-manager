{ ... }: {
  programs.newsboat = {
    enable = true;
    autoReload = true;
    extraConfig = ''
                color background default default
            color listnormal color255 default
            color listfocus color238 color255 standout
            color listnormal_unread color47 default
            color listfocus_unread color238 color47 standout
            color info color141 color236

            # highlights
            highlight all "---.*---" yellow
            highlight feedlist ".*(0/0))" black
            highlight article "(^Feed:|^Title:|^Date:|^Link:|^Author:)" cyan default bold
            highlight article "https?://[^ ]+" yellow default
            highlight article "\\[[0-9][0-9]*\\]" magenta default bold
            highlight article "\\[image\\ [0-9]+\\]" green default bold
            highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
            highlight article ":.*\\(link\\)$" cyan default
            highlight article ":.*\\(image\\)$" blue default
            highlight article ":.*\\(embedded flash\\)$" magenta default

      # unbind keys
      unbind-key ENTER
      unbind-key j
      unbind-key k
      unbind-key J
      unbind-key K

      # bind keys - vim style
      bind-key j down
      bind-key k up
      bind-key l open
      bind-key h quit
      bind-key G end
      bind-key g home

      macro v set browser "down_yt_play " ; one; set browser firefox
      macro , open-in-browser
    '';
    urls = [
      {
        tags = [ "youtube" "coffee" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCMb0O2CdPBNi-QqPk5T3gsQ";
        title = "James Hoffmann";
      }
      {
        tags = [ "youtube" "coffee" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCzVR39nUsiTVaqRukZKyWlQ";
        title = "Não Sou Barista";
      }
      {
        tags = [ "news" "tech" ];
        url = "https://www.askwoody.com/feed/";
        title = "AskWoody";
      }
      {
        tags = [ "news" "tech" ];
        url = "https://techcrunch.com/feed/";
        title = "TechCrunch";
      }
      {
        tags = [ "youtube" "tech" "coding" "linux" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw";
        title = "ThePrimeagen";
      }
      {
        tags = [ "news" "tech" ];
        url = "https://www.theverge.com/rss/index.xml";
        title = "The Verge";
      }
      {
        tags = [ "news" "math" ];
        url = "https://www.ams.org/cgi-bin/content/news_items.cgi?rss=1";
        title = "American Mathematical Society";
      }
      {
        tags = [ "youtube" "tech" "life" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
        title = "Luke Smith";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCaiL2GDNpLYH6Wokkk1VNcg";
        title = "mCoding";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA";
        title = "Mental Outlaw";
      }
      {
        tags = [ "youtube" "anime" "manga" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC7dF9qfBMXrSlaaFFDvV_Yg";
        title = "Gigguk";
      }
      {
        tags = [ "youtube" "audiophile" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC7fN3sq7h2BDFtBrzXWo4Zg";
        title = "MIND THE HEADPHONE";
      }
      {
        tags = [ "youtube" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCtzeHEIagYykh_TuwjAS6kA";
        title = "IMPERA";
      }
      {
        tags = [ "youtube" "tech" "gadgets" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYOj4DmyxhBVrdvbsUwmAA";
        title = "optimum";
      }
      {
        tags = [ "tech" "keyboard" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCzqmTtRqjBgQ_cybekKVGHA";
        title = "Keybored";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCVYamHliCI9rw1tHR1xbkfw";
        title = "Dave2D";
      }
      {
        tags = [ "youtube" "tech" "keyboard" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC4NNPgQ9sOkBjw6GlkgCylg";
        title = "Ben Vallack";
      }
      {
        tags = [ "youtube" "tech" "low_level" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC8uT9cgJorJPWu7ITLGo9Ww";
        title = "The 8-Bit Guy";
      }
      {
        tags = [ "youtube" "movies" "theories" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCIJhUaFcOoxyE4ImRpCaNhw";
        title = "schne";
      }
      {
        tags = [ "youtube" "math" "science" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCZcBeMQLxvjhsW3PEYXuiAA";
        title = "Memeable Data";
      }
      {
        tags = [ "youtube" "audiophile" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCurv9zw0LturSVaqI6NgdrQ";
        title = "crinacle";
      }
      {
        tags = [ "youtube" "math" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCQBQeWDycPczq1zril7hHHg";
        title = "polylog";
      }
      {
        tags = [ "youtube" "coding" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA";
        title = "Fireship";
      }
      {
        tags = [ "youtube" "tech" "gadgets" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCgdTVe88YVSrOZ9qKumhULQ";
        title = "Hardware Haven";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ";
        title = "Chris Titus Tech";
      }
      {
        tags = [ "youtube" "science" "math" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA";
        title = "Veritasium";
      }
      {
        tags = [ "youtube" "tech" "gadgets" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCBJycsmduvYEL83R_U4JriQ";
        title = "Marques Brownlee";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg";
        title = "Wolfgang's Channel";
      }
      {
        tags = [ "youtube" "gaming" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCivETRAS-l1zO3RaR9f8PjA";
        title = "Raz";
      }
      {
        tags = [ "youtube" "math" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCYO_jab_esuFRV4b17AJtAw";
        title = "3Blue1Brown";
      }
      {
        tags = [ "youtube" "tech" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCib793mnUOhWymCh2VJKplQ";
        title = "Fabio Akita";
      }
      {
        tags = [ "youtube" "gaming" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCfHmyqCntYHQ81ZukNu66rg";
        title = "Razbuten";
      }
      {
        tags = [ "youtube" "tech" "gadgets" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYeRa2iUMd8An1WTPIP2bw";
        title = "aChair Leg";
      }
      {
        tags = [ "youtube" "music" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCXkNod_JcH7PleOjwK_8rYQ";
        title = "Polyphonic";
      }
      {
        tags = [ "youtube" "coding" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCaSCt8s_4nfkRglWCvNSDrg";
        title = "CodeAesthetic";
      }
      {
        tags = [ "youtube" "general" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCBa659QWEk1AI4Tg--mrJ2A";
        title = "Tom Scott";
      }
      {
        tags = [ "youtube" "gaming" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCqJ-Xo29CKyLTjn6z2XwYAw";
        title = "Game Maker's Toolkit";
      }
      {
        tags = [ "youtube" "tech" "low_level" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UCS0N5baNlQWJCUrhCEo8WlA";
        title = "Ben Eater";
      }
    ];
  };
}

