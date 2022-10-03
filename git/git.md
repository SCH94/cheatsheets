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

    $git config --list 
    $git config --global user.name ""   
    $git config --global user.mail ""  
      
    $nano ~/.gitconfig 
        
  ### Help  
        
    $git help   
    $git help | less   
    $cat ~/.gitconfig   

  ### Adding SSH key

    $ssh-keygen -t rsa -b 2048 
    $cat id_rsa.pub 
    :- copy the key and paste it in github/gitlab 
        
  ## Pushing existing folder  
    
    $mkdir ./cheatsheets/git/   
    $cd ./cheatsheets/git   
        
  ### Converting Directory to repository  
        
    $git init   
      
    Creates .git directory to track changes.  
      
    $cat ./.git/config   
        
  ### Our first commit  
      
    Git wont allow us to complete initialization of the repo if unchanged  
        
      $touch git.md   
      $git status   
        
    We can see that git.md is untracked  
        
      $git add -A   
        
    -A: add all untracked files  
        
      $git status   
        
      $git log  

  ### Commiting changes

    $git commit -m "MESSAGE" 

  ### Adding remote

    $git remote add origin https://gitlab.com/SCH94/testproject.git 

  ### Pushing changes

    $git push -uf origin master 

  ### Pushing existing repo

    $git remote rename origin old-origin 
    $git remote add origin https://gitlab.com/SCH94/testproject.git 
    $git push -u origin --all 
    $git push -u origin --tags 

  ## Create a new repository

    $git clone <"REPO_URL"> 
    $cd cloned_dir 
    $touch file 
    $git add . 
    $git commit -m "Initial commit" 
    $git push -u origin master 

  ## Branching

  ### List current branches

    $git branch 
    * :- current branch 

  ### Creating new branch

    $git branch <branch name> 

  ### Changing branch

    $git checkout <branch name> 
    $git add . 
    $git commit -m "commit" 
    $git push origin <branch name> 

  ### Merging branch with master

    $git checkout master   
    $git pull  
    $git merge <branch name>  
    $git push  
  '''
  branch early, and branch often
  '''
<<<<<<< HEAD
=======

  ### Deeper look at git

    $ touch test{1..4}.md
    $ git add test1.md && git commit -m 'Create first file'
    $ git add test2.md && git commit -m 'Create send file'
    $ git add test3.md && git commit -m 'Create third file and create fourth file'

  ### Changing The Last Commit
    
    Above we forgot to add a 4th file, so lets add it

    $ git add test4.md
    $ git commit --amend
  
    NOTE:--> Remember to only amend commits that have not been pushed anywhere! The reason for this is that git commit --amend does not simply edit the last commit, it replaces that commit with an entirely new one.This means that if you were to amend a commit other developers are basing their work on, you’re effectively destroying a commit they could be basing their work off of. When rewriting history always make sure that you’re doing so in a safe manner, and that your coworkers are aware of what you’re doing.

  ### Changing Multiple Commits

    rebase -i --> is a command which allows us to interactively stop after each commit we’re trying to modify, and then make whatever changes we wish. We do have to tell this command which is the last commit we want to edit. For example, 
    
    $ git rebase -i HEAD~2 --> allows us to edit the last two commits.

    let’s look at the commit messages at the top of the tool. If we wanted to edit one of these commits, we would change the word pick to be edit for the appropriate commit. If we wanted to remove a commit, we would simply remove it from the list, and if we wanted to change their order, we would change their position in the list. 

      edit eacf39d Create send file
      pick 92ad0af Create third file and create fourth file
    
    This would allow us to edit the typo in the Create send file commit to be Create second file.

      You can amend the commit now, with
        git commit --amend
      Once you're satisfied with your changes, run
        git rebase --continue
      
        git log

    NOTE: --> if you have to rebase commits in a shared repository, make sure you’re doing so for a very good reason that your coworkers are aware of.
  
  ### Squashing Commits

    squash --> makes it easier for others to understand the history of your project.

    squash the second commit into the first commit on the list, which is Create first file.

      git rebase -i --root
    
    pick that first commit, as the one which the second commit is being squashed into

      pick e30ff48 Create first file
      squash 92aa6f3 Create second file
      pick 05e5413 Create third file and create fourth file
    
    Rename the commit to Create first and second file,

      git rebase --continue
>>>>>>> devops

    
      
