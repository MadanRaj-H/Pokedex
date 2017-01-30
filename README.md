# Pokedex
Awesome Pokedex mobile App

The app lists all different types of POKEMON which includes Pokemon's
  * Attack
  * Defense
  * Height
  * Weight
  * Description
  * Next level of Evolution
  
 <img src="https://cloud.githubusercontent.com/assets/15614313/22422171/124eca26-e711-11e6-82b9-edec556c493c.png" width="240"><br>
 <img src="https://cloud.githubusercontent.com/assets/15614313/22422173/12519012-e711-11e6-9883-e8b01cde26d5.png" width="240"><br>
 <img src="https://cloud.githubusercontent.com/assets/15614313/22422172/125137fc-e711-11e6-9d36-c230c06dfa5a.png" width="240">
 <br>
 <img src="https://cloud.githubusercontent.com/assets/15614313/22422174/1254e000-e711-11e6-97f3-ddb75f4ebc15.png" width="240">
 <br>
  
  REST API - https://pokeapi.co/api/v1/pokemon/1/
  
  <B> <h3>Networking calls have been made via Alamofire. To install Alamofire first u install cocoapods</h3> </B>

  1) sudo gem install cocoapods
  
  Go to your working deirectory and initialize pod
  
  2) pod init
  
  Open your pod file and do the pod configuration
  
  3) source 'https://github.com/CocoaPods/Specs.git' <br>
      platform :ios, '10.0' <br>
      use_frameworks! <br>

      target '<Your Target Name>' do <br>
        pod 'Alamofire', '~> 4.3' <br> 
      end <br> 
   
   <B><h3> UI Layout Implementation: > </h3> <B>
    
     *) UICollectionView for dynamically populating pokemons
     *) UIStackView for easy layout
     
    
     
     
  
    
  
