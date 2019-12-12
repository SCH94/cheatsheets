# Getting started  
  
  ## Installation & Setup  
    
    $which git  
      
    $sudo apt-get install git  
      
  ### Installing from source  
    
    $curl -Oo git.zip url  
      
    $unzip git.zip  
      
    $make prefix=/usr/local all  
    $sudo make prefix=/usr/local install  
      
    $git clone url  
      
    $make prefix=/usr/local all  
    $sudo make prefix=/usr/local install  
      
  ### Configuration  
    
    $git config --global user.name ""  
    $git config --global user.mail ""  
      
    $nano ~/.gitconfig  
      
  ### Help  
    
    $git help  
    $git help | less  
    $cat ~/.gitconfig  
      
  ## Initializing The Repo  
    
    $mkdir ./cheatsheets/git/  
    $cd ./cheatsheets/git  
      
  ### Converting Directory to repository  
    
    $git init  
      
    Creates .git directory to track changes.  
      
    $cat ./.git/config  
      
  ## Our first commit  
    
    Git wont allow us to complete initialization of the repo if unchanged  
      
    $touch git.md  
    $git status  
      
    We can see that git.md is untracked  
      
    $git add -A  
      
    -A: add all untracked files  
      
    $git status  
      
    
  
    
