var fs = require("fs");


//TODO create an object and loop through it instead of defining each sym link manual
var home = __dirname;
console.log(home);

fs.symlink(home + "/dotfiles/bash_profile", home + "/.bash_profile", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("bash_profile completed")
});


fs.symlink(home + "/dotfiles/bashcustom", home + "/.bashcustom", "dir", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("bashcustom completed")
});

fs.symlink(home + "/dotfiles/vim", home + "/.vim", "dir", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vim folder completed")
});


fs.symlink( home + "/dotfiles/vimrc", home + "/.vimrc", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vimrc completed")
});

fs.symlink( home + "/dotfiles/viminfo", home + "/.viminfo", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vimrc completed")
});


fs.symlink( home + "/dotfiles/vimwords.add", home + "/.vimwords.add", "file", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("vimrc completed")
});



fs.symlink(home + "/dotfiles/fonts", home + "/.fonts", "dir", function(err){
    if(err) {
        console.log(err)
        return;
    }
    console.log("bashcustom completed")

