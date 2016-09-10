#!/bin/bash
cd /opt/freemesh.dk
wget -r -k -l 1 -c --mirror https://freifunk.lu/
# oder -m -np -p  http://stackoverflow.com/questions/6145641/wget-how-to-mirror-only-a-section-of-a-website/6145717#6145717

mv freifunk.lu fmdk

# css repair:
find fmdk/ -type f|while read f; do sed -i 's/css?/css%3F/g' "$f" ; done
for i in fmdk/wp-content/themes/ff-wp-theme/css/*; do sed -i 's/}/}\n/g' $i; done

# js repair:
find fmdk/ -type f|while read f; do sed -i 's/js?/css%3F/g' "$f" ; done


rm fmdk/lb/ -Rf

# ad some CSS to hide stuff
echo '.qtranxs_image_lb{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2  
echo '#qtranslate-2{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '#qtranslate-2,#recent-posts-2,#archives-2{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '.fa-comment,.post-categories,.author{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo 'address.author{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '.entry-header address.author{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '.fa-pencil, .fa-calender{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '.fa{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo 'i.fa{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo '.nav-next{display:none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2 
echo 'a::after{display: none;}'>>fmdk/wp-content/themes/ff-wp-theme/css/normalize.css\?ver\=3.0.2

#rename site
find fmdk/ -type f|while read f; do sed -i 's/Freifunk/Freemesh/g' "$f" ; done  
find fmdk/ -type f|while read f; do sed -i 's/Luxembourg/Denmark/g' "$f" ; done 
#domain
find fmdk/*  -type f|while read f; do sed -i 's/freifunk.lu/freemesh.dk/g' "$f" ; done
# replace firmware link
find fmdk/*  -type f|while read f; do sed -i 's~firmware.freemesh.dk~vm02.eclabs.de/firmware/fmdk~g' "$f" ; done 
find fmdk/*  -type f|while read f; do sed -i 's~firmware/fmdk/experimental~firmware/fmdk~g' "$f" ; done
#hackerspace
find fmdk/*  -type f|while read f; do sed -i 's~level2.lu~osaa.dk~g' "$f" ; done
find fmdk/*  -type f|while read f; do sed -i 's~Level2~Open Space Aarhus~g' "$f" ; done
#Twitter
find fmdk/*  -type f|while read f; do sed -i 's~Freemeshlux~OpenSpaceAArhus~g' "$f" ; done
#mailinglist
find fmdk/*  -type f|while read f; do sed -i 's~info@luxembourg.freemesh.dk~coming-soon@freemesh.dk~g' "$f" ; done
# rename about page
find fmdk/*  -type f|while read f; do sed -i 's~about-freemesh.dkxembourg~about~g' "$f" ; done
mv /opt/freemesh.dk/fmdk/about-freifunk-luxembourg /opt/freemesh.dk/fmdk/about
mv /opt/freemesh.dk/fmdk/en/about-freifunk-luxembourg/ /opt/freemesh.dk/fmdk/en/about
mv /opt/freemesh.dk/fmdk/de/about-freifunk-luxembourg/ /opt/freemesh.dk/fmdk/de/about

