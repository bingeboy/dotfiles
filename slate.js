// Configs
S.cfga({
  'defaultToCurrentScreen' : true,
  'secondsBetweenRepeat' : 0.1,
  'checkDefaultsOnLoad' : true,
  'focusCheckWidthMax' : 3000,
  windowHintsIgnoreHiddenWindows: false,
  windowHintsSpread: true,
  windowHintsFontSize: 25,
  windowHintsWidth: 50,
  windowHintsHeight: 50,
  windowHintsShowIcons: true,
  orderScreensLeftToRight: true
});

var hyper = 'ctrl;shift;alt;cmd';

// ------- Monitor assignments
//var monLap = '1440x900';
//
// //////////////////////////////////////////////// JP setup your monitors~
//
//
//
//
//// Home Monitors
//var monSonic = '1920x1080';
//var monSam = '1680x1050';
//
//// Work Monitors
//var monDell = '1920x1200';
//var monHp = '1920x1080';
var monLap, monMid, monRight;
if (S.screenCount() === 2) {
  monLap = '0';
  monMid = '1';
  monRight = '-1'; // -1  === not in use 
} else {
  monLap = '0';
  monMid = '1';
  monRight = '2';
}

// ------- Move operation assignments
var moveScreenOp = S.op('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'windowSizeX',
  height: 'windowSizeY'
});

var moveToLap = moveScreenOp.dup({
  screen: monLap
});

var moveToMid = moveScreenOp.dup({
  screen: monMid
});

var moveToRight = moveScreenOp.dup({
  screen: monRight
});

var moveOp = S.op('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY'
});

var moveLapOp = moveOp.dup({ screen: monLap });
var moveMidOp = moveOp.dup({ screen: monMid });
var moveRightOp = moveOp.dup({ screen: monRight });

// I don't really use these....but just in case
var moveMidOpTop = moveMidOp.dup({ height : 'screenSizeY/2' });
var moveMidOpTopLeft = moveMidOpTop.dup({ width : 'screenSizeX/2' });
var moveMidOpTopRight = moveMidOpTopLeft.dup({ x : 'screenOriginX+screenSizeX/2' });
var moveMidOpBottom = moveMidOpTop.dup({ y : 'screenOriginY+screenSizeY/2' });
var moveMidOpBottomLeft = moveMidOpBottom.dup({ width : 'screenSizeX/3' });
var moveMidOpBottomMid = moveMidOpBottomLeft.dup({ x : 'screenOriginX+screenSizeX/3' });
var moveMidOpBottomRight = moveMidOpBottomLeft.dup({ x : 'screenOriginX+2*screenSizeX/3' });
var moveMidOpLeft = moveMidOpTopLeft.dup({ height : 'screenSizeY' });
var moveMidOpRight = moveMidOpTopRight.dup({ height : 'screenSizeY' });
var moveMidOpTopLeft = moveMidOpTopLeft.dup({ screen : monMid });
var moveMidOpBottomLeft = moveMidOpTopLeft.dup({ y : 'screenOriginY+screenSizeY/2' });
var moveMidOpRight = moveMidOpRight.dup({ screen : monMid });

var moveMidiTerm = moveMidOp.dup({
  width: 'screenSizeX*0.3'
});

var moveMidMidOp = moveMidOp.dup({
  width: '(screenSizeX/1.35)',
  x: '(screenSizeX/6.75)'
});

var moveMidMacVim = moveMidOp.dup({
  width: 'screenSizeX*0.80',
  x: 'screenSizeX*0.20'
});

var moveRightAdiumOp = S.op('corner', {
  screen: monRight,
  direction: 'top-left',
  width: 'screenSizeX/2.5',
  height: 'screenSizeY/2'
});

var moveRightLimeChatOp = moveRightAdiumOp.dup({
});

// Messages app op
var moveRightMessagesOp = moveRightAdiumOp.dup({
  direction: 'bottom-right',
  width: 'screenSizeX/2.5',
  height: 'screenSizeY/2'
});

// HipChat app op
var moveRightHipChatOp = moveRightAdiumOp.dup({
  direction: 'bottom-left',
  width: 'screenSizeX/2.5',
  height: 'screenSizeY/2'
});

var moveLapAdiumOp = moveRightAdiumOp.dup({
  screen: monLap,
  width: 'screenSizeX/2',
  height: 'screenSizeY/1.25'
});

var moveLapLimeChatOp = moveLapAdiumOp.dup({
});

var moveLapMessagesOp = moveRightMessagesOp.dup({
  screen: monLap
});

var moveLapHipChatOp = moveRightHipChatOp.dup({
  screen: monLap,
  width: 'screenSizeX/2',
  height: 'screenSizeY/1.75'
});

var moveChromeWindow = S.op('corner', {
  screen: monRight,
  direction: 'top-right',
  width: 'screenSizeX/1.35',
  height: 'screenSizeY'
});

// ------ Resize ops
var resizeHalfLeft = S.op('move', {
  height: 'screenSizeY',
  width: 'screenSizeX/2',
  x: '0',
  y: '0'
});

var resizeHalfRight = resizeHalfLeft.dup({
  x: 'screenSizeX/2'
});

var resizeHalfTop = resizeHalfLeft.dup({
  height: 'screenSizeY/2',
  width: 'screenSizeX'
});

var resizeHalfBot = resizeHalfTop.dup({
  y: 'screenSizeY/2'
});

var resizeMidHalf = resizeHalfLeft.dup({
  x: '(screenSizeX/4)'
});

var resizeFull = resizeHalfLeft.dup({
  height: 'screenSizeY',
  width: 'screenSizeX'
});

// ------ Layouts

var midLayoutFull = {
  'operations' : [moveMidOp],
  'ignore-fail' : true,
  'repeat' : true
};
var lapLayoutFull = {
  'operations' : [moveLapOp],
  'ignore-fail' : true,
  'repeat' : true
};

var rightLayoutFull = {
  'operations' : [moveRightOp],
  'ignore-fail' : true,
  'repeat' : true
};

// This op is for a single chrome window to move to lap monitor
// looking for twitter
var moveGoogWithTwitter = function(window) {
  var title = window.title();
  if (title !== undefined && title.match(/TweetDeck/g)) {
    window.doOperation(moveLapOp);
  } else {
    window.doOperation(moveRightOp);
  }
};

var threeMonLayout = S.layout('threeMon', {
  '_before_': {},
  '_after_': {},
  Adium: {
    operations: [moveRightAdiumOp],
    'ignore-fail': true,
    'title-order': ['Contacts'], // important for order of operations
    'repeat-last': true
  },
  LimeChat: {
    operations: [moveRightLimeChatOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  iTerm: {
    operations: [moveMidiTerm],
    'ignore-fail': true,
    'repeat-last': true
  },
  MacVim: {
    operations: [moveMidMacVim],
    'ignore-fail': true,
    'repeat-last': true
  },
  Atom: {
    operations: [moveMidMacVim],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Light Table': {
    operations: [moveMidMacVim],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Google Chrome': {
    operations: [moveGoogWithTwitter, moveChromeWindow],
    'title-order': ['TweetDeck'], // important for order of operations
    'ignore-fail': true,
    'repeat-last': true
  },
  iTunes: {
    operations: [resizeHalfRight, resizeHalfLeft],
    'title-order': ['Equalizer'], // important for order of operations
    'ignore-fail': true,
    'repeat-last': true
  },
  Messages: {
    operations: [moveRightMessagesOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Calendar: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Mail: {
    operations: [moveRightOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  HipChat: {
    operations: [moveRightHipChatOp],
    'ignore-fail': true,
    'repeat-last': true
  }
});

var twoMonLayout = S.layout('twoMon', {
  '_before_': {},
  '_after_': {},
  Adium: {
    operations: [moveLapAdiumOp],
    'ignore-fail': true,
    'title-order': ['Contacts'], // important for order of operations
    'repeat-last': true
  },
  LimeChat: {
    operations: [moveLapLimeChatOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Evernote: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  iTerm: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  MacVim: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Atom: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Light Table': {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Google Chrome': {
    operations: [moveMidMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Messages: {
    operations: [moveLapMessagesOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  HipChat: {
    operations: [moveLapHipChatOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  iTunes: {
    operations: [moveMidOp],
    'title-order': ['Equalizer'], // important for order of operations
    'ignore-fail': true,
    'repeat-last': true
  },
  Calendar: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Mail: {
    operations: [moveRightOp],
    'ignore-fail': true,
    'repeat-last': true
  }
});

var oneMonLayout = S.layout('oneMon', {
  '_before_': {},
  '_after_': {},
  Adium: {
    operations: [moveLapAdiumOp],
    'ignore-fail': true,
    'title-order': ['Contacts'], // important for order of operations
    'repeat-last': true
  },
  LimeChat: {
    operations: [moveLapLimeChatOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Evernote: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  iTerm: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  MacVim: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Atom: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Light Table': {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  'Google Chrome': {
    operations: [moveLapOp],
    'ignore-fail': true,
    'title-order': [], // TODO move other google windows to monRight
    'repeat-last': true
  },
  iTunes: {
    operations: [moveMidOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Messages: {
    operations: [moveLapMessagesOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Calendar: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  Mail: {
    operations: [moveLapOp],
    'ignore-fail': true,
    'repeat-last': true
  },
  HipChat: {
    operations: [moveLapHipChatOp],
    'ignore-fail': true,
    'repeat-last': true
  }
});

var threeMonOp = S.op('layout', { name: threeMonLayout });
var twoMonOp = S.op('layout', { name: twoMonLayout });
var oneMonOp = S.op('layout', { name: oneMonLayout });

// ---- Default layouts
S.def([monLap, monMid, monRight], threeMonLayout);
S.def([monMid, monRight], twoMonLayout);
S.def([monLap], oneMonLayout);

// --- Commands

var universalLayout = function() {
  if (S.screenCount() === 3) {
    threeMonOp.run();
  } else if (S.screenCount() === 2) {
    twoMonOp.run();
  } else if (S.screenCount() === 1) {
    oneMonOp.run();
  }
};

// ------ Key Bindings
S.bnda({
  // Layout Bindings
  'esc:ctrl' : universalLayout,

  // Basic Location Bindings
  '1:ctrl;cmd': moveToLap,
  '2:ctrl;cmd': moveToMid,
  '3:ctrl;cmd': moveToRight,

  // Resize bindings
  '6:ctrl;alt': resizeMidHalf,
  '0:ctrl;alt': resizeHalfRight,
  '7:ctrl;alt': resizeHalfLeft,
  '8:ctrl;alt': resizeHalfBot,
  '9:ctrl;alt': resizeHalfTop,
  '-:ctrl;alt': resizeFull,

  // Resize Bindings
  // Sizing
  /*
  '0:ctrl;alt' : S.op('resize', { 'width' : '+10%', 'height' : '+0' }),
  '7:ctrl;alt' : S.op('resize', { 'width' : '-10%', 'height' : '+0' }),
  '8:ctrl;alt' : S.op('resize', { 'width' : '+0', 'height' : '-10%' }),
  '9:ctrl;alt' : S.op('resize', { 'width' : '+0', 'height' : '+10%' }),

  '7:ctrl;cmd' : S.op('resize', { 'width' : '-10%', 'height' : '+0', 'anchor' : 'bottom-right' }),
  '0:ctrl;cmd' : S.op('resize', { 'width' : '+10%', 'height' : '+0', 'anchor' : 'bottom-right' }),
  '8:ctrl;cmd' : S.op('resize', { 'width' : '+0', 'height' : '+10%', 'anchor' : 'top-left' }),
  '9:ctrl;cmd' : S.op('resize', { 'width' : '+0', 'height' : '-10%', 'anchor' : 'bottom-right' }),
  */

  // Window Hints
  'esc:cmd' : S.op('hint'),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //'tab:cmd' : S.op('switch'),

  // Grid
  'esc:alt' : S.op('grid')
});

// Log that we're done configuring
S.log('[SLATE] -------------- Finished Loading Config --------------');
