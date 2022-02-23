# Getting started  
  
## Installation & Setup  
    
  `$which git`  
      
  `$sudo apt-get install git`  
      
### Installing from source  
    
  `$curl -Oo git.zip url`  
      
  `$unzip git.zip`  
      
  `$make prefix=/usr/local all`  
  `$sudo make prefix=/usr/local install`  
      
  `$git clone url`  
      
  `$make prefix=/usr/local all`  
  `$sudo make prefix=/usr/local install`  
      
### Configuration  

  `$git config --list`
  `$git config --global user.name ""`  
  `$git config --global user.mail ""` 
      
  `$nano ~/.gitconfig`
      
### Help  
      
  `$git help`  
  `$git help | less`  
  `$cat ~/.gitconfig`  

### Adding SSH key

  `$ssh-keygen -t rsa -b 2048`
  `$cat id_rsa.pub`
  `:- copy the key and paste it in github/gitlab`
      
## Pushing existing folder  
  
  `$mkdir ./cheatsheets/git/`  
  `$cd ./cheatsheets/git`  
      
### Converting Directory to repository  
      
  `$git init`  
      
  Creates .git directory to track changes.  
      
  `$cat ./.git/config`  
      
### Our first commit  
    
  Git wont allow us to complete initialization of the repo if unchanged  
      
  `$touch git.md`  
  `$git status`  
      
  We can see that git.md is untracked  
      
  `$git add -A`  
      
  -A: add all untracked files  
      
  `$git status`  
      
  `$git log` 

### Commiting changes

  `$git commit -m "MESSAGE"`

### Adding remote

  `$git remote add origin https://gitlab.com/SCH94/testproject.git`

### Pushing changes

  `$git push -uf origin master`

### Pushing existing repo

  `$git remote rename origin old-origin`
  `$git remote add origin https://gitlab.com/SCH94/testproject.git`
  `$git push -u origin --all`
  `$git push -u origin --tags`

## Create a new repository

  `$git clone <"REPO_URL">`
  `$cd cloned_dir`
  `$touch file`
  `$git add .`
  `$git commit -m "Initial commit"`
  `$git push -u origin master`

## Branching

### List current branches

  `$git branch`
  `* :- current branch`

### Creating new branch

  `$git branch <branch name>`

### Changing branch

  `$git checkout <branch name>`
  `$git add .`
  `$git commit -m "commit"`
  `$git push origin <branch name>`

 ### Merging branch with master

   $git checkout master   
   $git pull  
   $git merge <branch name>  
   $git push  

  
    
