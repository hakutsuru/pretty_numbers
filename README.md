## Numeric Callouts

*Disclaimer: I may never use github the way it is intended. I have plans to share gems and projects that may involve collaboration, but I suspect most of my "projects" will be little more than code showcases.*


### Orientation

For reporting, I had to humanize various numbers for callouts. I had trouble getting ActionView helpers working, and I was concerned that even if I could get them working, I might have to use substitution to get the desired format anyway.

Hacking number formatting seemed easy and fun, except that this is one of those problems that always seems solved -- and then you run a few reports and discover edge cases that force you to start over again...

It should only take a few moments to see how this works, and I cannot imagine how it could be simpler. One idea might be to extract a method that returns the three digits (case statement from *humanize_number*), and use that to improve readability.


### Environment
    Macintosh-2:~] direwolf% ruby --version
    ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10]


### Example Code Run
    [Macintosh-2:~] direwolf% ruby [...]/pretty_numbers/format_numeric_callout.rb
    Representative numeric callouts...
    888             =>  888
    1001            =>  1K
    1009            =>  1.01K
    2112            =>  2.11K
    20999           =>  21K
    2099999         =>  2.1M
    666666666       =>  667M
    66667868898     =>  66.7B
    6666786889886   =>  eep!

