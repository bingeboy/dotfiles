var fs = require("fs");

//TODO create an object and loop through it instead of defining each sym link manual

fs.symlink("~/dotfiles/.bash_profile", "~/.bash_profile2", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("bash_profile completed")
});


fs.symlink("~/dotfiles/.bashcustom", "~/.bashcustom", "dir", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("bashcustom completed")
});

fs.symlink("~/dotfiles/.vim", "~/.vim", "dir", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vim completed")
});


fs.symlink("~/dotfiles/.vimrc", "~/.vimrc", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vimrc completed")
});



