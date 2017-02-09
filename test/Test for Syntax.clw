Created from _CW.schclass written by Dave Bratovich


! //-----------------------------------------------------------------------
! //* Global attributes ***************************************************
! //-----------------------------------------------------------------------
! //    global:FirstParseInSeparateThread   = 1      ! // {0,1} default=1
! //    global:EditReparceInSeparateThread  = 1      ! // {0,1} default=1
! //    global:ConfigChangedReparceInSeparateThread= 1  ! // {0,1} default=1
! //    global:EditReparceTimeout_ms  = 500          ! // default= 500 ms; time out for start reparse after last key was pressed.
! //    global:MaxBackParseOffset     = 100    ! // default= 100 chars; maximum back buffer size. Some times parser look back for the text from current position.
! //    global:OnScreenSchCacheLifeTime_sec = 180       ! // default= 180 sec; -1 and 0 means infinite; time out for on screen parsed pices of text. for memory using optimization.
! //    global:ParserThreadIdleLifeTime_sec = 60        ! // default=60 sec; -1 and 0 means infinite; time out for existing of parser thread when parser idle (no parse requests).
   
! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! ///
! //================ Variables support ====================================
! //=======================================================================
! // NON operation - example:   @alpha:not
! //
! // @alpha      = a-z, A-Z
! // @digit      = 0-9
! // @HexDdigit  = 0-9, a-f, A-F
! // @specs      = "~`!@#$%^&*()_-+=\\|{}[];:'\",.<>/?"
! // @EOL     = End Of Line
! //---------------------------------------------
! // special tags:  '\\', '\'', '\t', '\r', '\n'
! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! //! ///

! /// HTML ! ///   
!lexClass:
!   parent:file = <*.CLW>
!   name     = C_CW
!   txt:colorFG = 0x000000                              ! //Black; change color here
!   DisplayName = 'Normal Text'
!:lexClass                                                  
!
! //=============================================================================
! //*** Colorization Rules         *** ==========================================
! //=============================================================================
! //lexClass:    
! //    name     = C_Group
! //    parent   = C_CW,CW_Keywords_1,CW_DataTypes, C_Block
! //    token:start:separators = ' ', '\t', @specs, @eol 
! //    token:end:separators   = ' ', '\t', @specs, @eol 
! //    start:Tag = 'Group'
! //    end:tag   = 'End'
! //    caseSensitive = 0
! //    ParseOnScreen = 0
! //    txt:Bold      = 0
! //    Collapsable   = 1                                                         ! //Allow code folding
! //    CollapsedText= 'Group Structure...'
! //:lexClass 

! //lexClass:    
! //    name          = C_Block
! //    parent        = C_Group 
! //    caseSensitive = 0
! //    ParseOnScreen = 0
! //    txt:Bold      = 1
 Group
 End
! //    txt:colorFG   = 0xFF55FF                                                  ! //pink
! //:lexClass 

!lexClass:                                            ! //Test Object class
!    name          = CW_Objects_1
!    parent        = C_CW
!    children      = CW_object_meep
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 1
!    token:start:separators = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '^' , '&' , '*' , ',',''
!    token:start:separators = '=' , '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':' , ','
!    token:start:separators = '"' , '.' , '<' , '>' , '/' , '(' , ')' , '-' , '+', @eol , '\t' 
!    token:end:separators   = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '&' 
!    token:end:separators   = '*' , '(' , ')' , '-' , '+' , '=' , '^' 
!    token:end:separators   = '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':'   
!    token:end:separators   = '"' , ',' , '.' , '<' , '>' , '/' , @eol , '\t' 
!    txt:colorFG = 0xff8c00                             ! // orange bold     

!   INIMgr
    SELF
!    GlobalErrors
    Parent
!    ThisWindow
!:lexClass  
!
!lexClass:                                             ! //Test Object Method/Property class
!    name          = CW_object_mp
!    parent        = C_CW,CW_Objects_1 
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    txt:colorFG = 0xff0000                            ! //Red                                              
!    .SetProcedureName
!    .Init
!    .AddItem
!    .Reset
!    .Kill
!    .Run
!    .TakeAccepted
!    .TakeEvent
!    .TakeFieldEvent
!    .TakeSelected
!    .TakeWindowEvent
!    .Update
!:lexClass  
!
!lexClass:                                             ! //Test Noyantis Object Class
!    name          = NY_Objects_
!    parent        = C_CW
!    children      = NY_CObject,NY_Number
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 1
!    token:start:separators = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '^' , '&' , '*' , ',',''
!    token:start:separators = '=' , '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':' , ','
!    token:start:separators = '"' , '.' , '<' , '>' , '/' , '(' , ')' , '-' , '+', @eol , '\t' 
!    token:end:separators   = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '&' 
!    token:end:separators   = '*' , '(' , ')' , '-' , '+' , '=' , '^' 
!    token:end:separators   = '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':'   
!    token:end:separators   = '"' , ',' , '.' , '<' , '>' , '/' , @eol , '\t', @digit 
!    end:Tag = @digit
!    txt:colorFG = 0x9966aa                            ! //Plum                               
!    TaskPanel
!    Toolbar
!    PropertyGrid
!    Syntaxedit
!:lexClass  
!
!lexClass:                                             ! //Test Noyantis Object Number Class
!    name          = NY_Number
!    parent        = C_CW,NY_CObject
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 1
!    token:start:separators = 'TaskPanel'
!    token:start:separators = 'Toolbar'
!    token:start:separators = 'PropertyGrid'
!    token:start:separators = 'Syntaxedit'
!    token:end:separators   = '.',' '
!    txt:colorFG = 0x9966aa                             ! //Plum                              
!    token:tag = @digit
!    
!:lexClass  
!
!
!lexClass:                                         ! //Test Noyantis Object Method/Property class
!    name          = NY_CObjects
!    parent        = C_CW,NY_Objects
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    txt:colorFG = 0x8a2be2                                    
!    .DisplayErrors
!    .GetGroupProperty
!    .OCXDirectCommand
!    .SetSortOrder
!    .SetVerbPanelHeight
!    .ApplyTheme
!    .ApplyTplSettings
!    .Kill
!    .OpenFile
!    .OCXDirectValue
!    .GetProperty
!    .SetProperty
!    .Undo
!    .Cut
!    .Paste
!    .Copy
!    .GetCurrentRow
!! // tons more to follow
!:lexClass  





! //***********************************************************************************************
! // Root Color syntax classes
! //***********************************************************************************************
!lexClass: 
!    name          = CW_Keywords_1
!    parent        = C_CW
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    token:start:separators = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '^' , '&' , '*' , ','
!    token:start:separators = '=' , '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':' , ','
!    token:start:separators = '"' , '.' , '<' , '>' , '/' , '(' , ')' , '-' , '+', '\t'
!    token:end:separators   = ' ' , '~' , '`' , '@' , '#' , '$' , '%' , '&' 
!    token:end:separators   = '*' , '(' , ')' , '-' , '+' , '=' , '^' 
!    token:end:separators   = '\' , '|' , '{' , '}' , '[' , ']' , ';' , ':'   
!    token:end:separators   = '"' , ',' , '.' , '<' , '>' , '/' , @eol , '\t' 
!    txt:colorFG = 0x0000FF                                                   ! //Blue

    above
    abs
    absolute
    accept
    accepted
    acos
    add
    address
    adjust
    after
    age
    alert
    alias
    all
    alone
    alrt
    and
    angle
    append
    application
    arc
    asin
    ask
    at
    atan
    auto
    ave
    band
    beep
    before
    begin
    below
    bevel
    binary
    bind
    bindable
    blank
    bof
    bor
    box
    boxed
    break
    bshift
    buffer
    build
    button
    bxor
    by
    c
    call
    cap
    case
    center
    centered
    chain
    change
    changes
    check
    choice
    choose
    chord
    chr
    class
    clear
    clip
    clipboard
    clock
    close
    cnt
    code
    color
    colordialog
    column
    combo
    compatibility
    command
    commit
    contents
    convertoemtoansi
    copy
    cos
    create
    cursor
    cycle
    data
    day
    date
    ddeacknowledge
    ddeapp
    ddechannel
    ddeclient
    ddeclose
    ddeexecute
    ddeitem
    ddepoke
    ddequery
    dderead
    ddeserver
    ddetopic
    ddevalue
    ddewrite
    default
    deformat
    delay
    delete
    derived
    destroy
    detail
    dim
    directory
    disable
    display
    dispose
    dll
    do
    dock
    docked
    document
    double
    down
    dragid
    driver
    drop
    dropid
    dup
    duplicate
    ellipse
    else
    elsif
    empty
    enable
    encrypt
    end
    endpage
    entry
    eof
    equate
    erase
    error
    errorcode
    evaluate
    event
    execute
    exists
    exit
    external
    field
    file
    filedialog
    fileerror
    fileerrorcode
    fileexists
    fill
    filter
    firstfield
    flat
    flush
    focus
    font
    fontdialog
    fontdialoga
    footer
    form
    format
    free
    from
    full
    fullname
    function
    get
    getfont
    getini
    getposition
    goto
    gray
    grid
    halt
    header
    help
    hide
    hlp
    hold
    hscroll
    hvscroll
    icon
    iconize
    idle
    if
    image
    imm
    include
    incomplete
    index
    inlist
    inner
    inrange
    ins
    instring
    interface
    int
    isalpha
    islower
    isstring
    isupper
    item
    itemize
    join
    key
    keyboard
    keychar
    keycode
    keystate
    keyword       ! I don't think this is a command, it's sort of an example entry in the ClarionHelp.chm (aka LRM)
    landscape
    last
    lastfield
    left
    len
    like
    line
    linewidth
    link
    list
    locale
    lock
    lockthread
    log10
    loge
    logout
    longpath
    loop
    lower
    map
    mark
    mask
    match
    max
    maximize
    mdi
    member
    memo
    menu
    menubar
    message
    meta
    min
    modal
    module
    month
    mousex
    mousey
    msg
    name
    new
    next
    nobar
    nocase
    noframe
    nomemo
    nomerge
    nosheet
    not
    null
    numeric
    ocx
    ocxgetparam
    ocxloadimage
    ocxregistereventproc
    ocxregisterpropchange
    ocxregisterpropedit
    ocxsetparam
    ocxunregistereventproc
    ocxunregisterpropchange
    ocxunregisterpropedit
    oem
    of
    ole
    oledirectory
    omitted
    once
    open
    opt
    option
    or
    order
    orof
    over
    ovr
    owner
    pack
    page
    pageafter
    pagebefore
    pageno
    palette
    panel
    paper
    pascal
    password
    path
    pdecimal
    peek
    pencolor
    penstyle
    penwidth
    pie
    pointer
    poke
    polygon
    popbind
    popup
    position
    post
    pre
    press
    presskey
    preview
    previous
    primary
    print
    printerdialog
    private
    proc
    procedure
    program
    progress
    project
    prompt
    protected
    pstring
    pushbind
    put
    putini
    queue
    radio
    random
    range
    raw
    readonly
    reclaim
    record
    records
    reget
    region
    register
    rejectcode
    release
    remove
    rename
    repeat
    replace
    report
    req
    reset
    resize
    return
    reverse        ! template language only 
    right
    rollback
    round
    roundbox
    routine
    run
    runcode
    savedialog
    scroll
    select
    selected
    send
    separator
    set
    set3dlook
    setclipboard
    setclock
    setcommand
    setcursor
    setdropid
    setfont
    setkeychar
    setkeycode
    setnonull
    setnull
    setpath
    setpencolor
    setpenstyle
    setpenwidth
    setposition
    settarget
    settoday
    share
    sheet
    shortpath
    show
    shutdown
    single
    sin
    size
    skip
    sort
    spin
    spread
    sqrt
    sreal
    start
    static
    status
    std
    step
    stop
    stream
    stretch
    sub
    sum
    system
    tab
    tally
    tan
    target
    text
    then
    thous
    thread
    threadlocked
    tiled
    time
    timer
    times
    tip
    to
    together
    today
    toolbar
    toolbox
    trn
    type
    unbind
    unhide
    unique
    unload
    unlock
    unlockthread
    unregister
    until
    up
    update
    upper
    upr
    use
    val
    value
    vbx
    vcr
    view
    virtual
    vscroll
    wallpaper
    watch
    what
    where
    while
    who
    window
    withnext
    withprior
    wizard
    wrap
    xor
    year
    yield
    zoom
!:lexClass 
!
!lexClass: 
!    name          = CW_Keywords_2
!    parent        = C_CW
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    token:start:separators = ' ', '\t', @specs, @eol 
!    token:end:separators   = ' ', '\t', @specs, @eol 
!    txt:colorFG   = 0xFF0000                                                            ! //Red
    assert
    compile
    omit
    section
!:lexClass
!
!lexClass: 
!    name          = CW_Keywords_3
!    parent        = C_CW
!    caseSensitive = 0
!    ParseOnScreen = 0
!    token:start:separators = ' ', '\t', @specs, @eol 
!    token:end:separators   = ' ', '\t', @specs, @eol 
!    txt:Bold      = 0
!    txt:colorFG   = 0x0f9f00                                                                ! //Forest Green
    beep:systemasterisk
    beep:systemdefault
    beep:systemexclamation
    beep:systemhand
    beep:systemquestion
    button:abort
    button:cancel
    button:help
    button:ignore
    button:no
    button:ok
    button:retry
    button:yes
    charset:ansi
    charset:arabic
    charset:baltic
    charset:chinesebig5
    charset:cyrillic
    charset:default
    charset:easteurope
    charset:gb2312
    charset:greek
    charset:hangeul
    charset:hebrew
    charset:johab
    charset:mac
    charset:oem
    charset:shiftjis
    charset:symbol
    charset:thai
    charset:turkish
    color:activeborder
    color:activecaption
    color:appworkspace
    color:aqua
    color:background
    color:black
    color:blue
    color:btnface
    color:btnhighlight
    color:btnshadow
    color:btntext
    color:captiontext
    color:fuschia
    color:gray
    color:graytext
    color:green
    color:highlight
    color:highlighttext
    color:inactiveborder
    color:inactivecaption
    color:inactivecaptiontext
    color:lime
    color:maroon
    color:menu
    color:menutext
    color:navy
    color:none
    color:olive
    color:purple
    color:red
    color:scrollbar
    color:silver
    color:teal
    color:white
    color:window
    color:windowframe
    color:windowtext
    color:yellow
    create:application
    create:box
    create:break
    create:button
    create:check
    create:combo
    create:custom
    create:detail
    create:dropcombo
    create:droplist
    create:ellipse
    create:entry
    create:footer
    create:form
    create:group
    create:header
    create:image
    create:item
    create:line
    create:list
    create:menu
    create:menubar
    create:ole
    create:option
    create:panel
    create:progress
    create:prompt
    create:radio
    create:region
    create:report
    create:sheet
    create:spin
    create:sstring
    create:string
    create:sublist
    create:tab
    create:text
    create:toolbar
    create:window
    cursor:arrow
    cursor:cross
    cursor:dragwe
    cursor:drop
    cursor:ibeam
    cursor:icon
    cursor:nodrop
    cursor:none
    cursor:size
    cursor:sizenesw
    cursor:sizens
    cursor:sizenwse
    cursor:sizewe
    cursor:uparrow
    cursor:wait
    cursor:zoom
    dde:auto
    dde:manual
    dde:remove
    dock:bottom
    dock:float
    dock:left
    dock:right
    dock:top
    event:accepted
    event:alertkey
    event:builddone
    event:buildfile
    event:buildkey
    event:closedown
    event:closewindow
    event:columnresize
    event:completed
    event:contracted
    event:contracting
    event:ddeadvise
    event:ddeclosed
    event:ddecommand
    event:ddedata
    event:ddeexecute
    event:ddepoke
    event:dderequest
    event:docked
    event:drag
    event:dragging
    event:drop
    event:droppeddown
    event:droppingdown
    event:expanded
    event:expanding
    event:gainfocus
    event:iconize
    event:iconized
    event:last
    event:locate
    event:losefocus
    event:maximize
    event:maximized
    event:mousedown
    event:mousein
    event:mousemove
    event:mouseout
    event:mouseup
    event:move
    event:moved
    event:newselection
    event:openfailed
    event:openwindow
    event:pagedown
    event:pageup
    event:prealertkey
    event:rejected
    event:restore
    event:restored
    event:resume
    event:scrollbottom
    event:scrolldown
    event:scrolldrag
    event:scrolltop
    event:scrolltrack
    event:scrollup
    event:selected
    event:selecting
    event:size
    event:sized
    event:suspend
    event:tabchanging
    event:timer
    event:undocked
    event:user
    event:vbxevent
    false
    ff_:archive
    ff_:directory
    ff_:hidden
    ff_:lfn
    ff_:normal
    ff_:readonly
    ff_:system
    file:directory
    file:keepdir
    file:longname
    file:maxfilename
    file:maxfilepath
    file:multi
    file:noerror
    file:save
    font:bold
    font:fixed
    font:italic
    font:regular
    font:strikeout
    font:thin
    font:underline
    font:weight
    icon:application
    icon:asterisk
    icon:child
    icon:clarion
    icon:connect
    icon:copy
    icon:cross
    icon:cut
    icon:ellipsis
    icon:exclamation
    icon:frame
    icon:hand
    icon:help
    icon:jumppage
    icon:new
    icon:nextpage
    icon:none
    icon:noprint
    icon:open
    icon:paste
    icon:pick
    icon:prevpage
    icon:print
    icon:print1
    icon:question
    icon:save
    icon:thumbnail
    icon:tick
    icon:vcrback
    icon:vcrbottom
    icon:vcrfastforward
    icon:vcrlocate
    icon:vcrplay
    icon:vcrrewind
    icon:vcrtop
    icon:zoom
    listzone:expandbox
    listzone:field
    listzone:header
    listzone:icon
    listzone:nowhere
    listzone:right
    listzone:tree
    match:nocase
    match:regular
    match:simple
    match:soundex
    match:wild
    ocx:1632bit
    ocx:16bit
    ocx:32bit
    ocx:default
    paper:10x14
    paper:11x17
    paper:a3
    paper:a4
    paper:a4small
    paper:a5
    paper:b4
    paper:b5
    paper:csheet
    paper:dsheet
    paper:env_10
    paper:env_11
    paper:env_12
    paper:env_14
    paper:env_9
    paper:env_b4
    paper:env_b5
    paper:env_b6
    paper:env_c3
    paper:env_c4
    paper:env_c5
    paper:env_c6
    paper:env_c65
    paper:env_dl
    paper:env_italy
    paper:env_monarch
    paper:env_personal
    paper:esheet
    paper:executive
    paper:fanfold_lgl_german
    paper:fanfold_std_german
    paper:fanfold_us
    paper:folio
    paper:last
    paper:ledger
    paper:legal
    paper:letter
    paper:lettersmall
    paper:note
    paper:quarto
    paper:statement
    paper:tabloid
    paper:user
    pen:dash
    pen:dashdot
    pen:dashdotdot
    pen:dot
    pen:insideframe
    pen:null
    pen:solid
    prop:above
    prop:abovesize
    prop:absolute
    prop:acceptall
    prop:active
    prop:addref
    prop:alias
    prop:align
    prop:alone
    prop:alrt
    prop:alwaysdrop
    prop:alwaysrebind
    prop:angle
    prop:appendbuffer
    prop:appinstance
    prop:ascending
    prop:asserthook
    prop:asserthook2
    prop:at
    prop:auto
    prop:autopaper
    prop:autosize
    prop:ave
    prop:background
    prop:below
    prop:belowsize
    prop:bevel
    prop:bevelinner
    prop:bevelouter
    prop:bevelstyle
    prop:binary
    prop:blob
    prop:blobs
    prop:boxed
    prop:breakvar
    prop:brokentabs
    prop:buffer
    prop:buttonfeq
    prop:cancel
    prop:canpaste
    prop:canpastelink
    prop:cap
    prop:center
    prop:centered
    prop:centerimage
    prop:centeroffset
    prop:charset
    prop:check
    prop:checked
    prop:child
    prop:childindex
    prop:choicefeq
    prop:class
    prop:clienthandle
    prop:clientheight
    prop:clientwidth
    prop:clientwndproc
    prop:clientx
    prop:clienty
    prop:clip
    prop:clipastrings
    prop:clipbits
    prop:clsid
    prop:cnt
    prop:color
    prop:colordialoghook
    prop:column
    prop:compatibility
    prop:completed
    prop:components
    prop:connectstring
    prop:copy
    prop:create
    prop:createfromfile
    prop:createlinktofile
    prop:ctrl
    prop:currentkey
    prop:cursor
    prop:dbmsver
    prop:ddemode
    prop:ddetimeout
    prop:deactivate
    prop:decimal
    prop:decimaloffset
    prop:default
    prop:defermove
    prop:delay
    prop:design
    prop:designmode
    prop:details
    prop:dim
    prop:disable
    prop:disconnect
    prop:dock
    prop:docked
    prop:document
    prop:double
    prop:doverb
    prop:down
    prop:dragid
    prop:driver
    prop:driverlogsoutalias
    prop:driverstring
    prop:drop
    prop:dropid
    prop:dropwidth
    prop:dup
    prop:edit
    prop:enabled
    prop:encrypt
    prop:eventswaiting
    prop:exeversion
    prop:falsevalue
    prop:fatalerrorhook
    prop:feq
    prop:fetchsize
    prop:field
    prop:fields
    prop:file
    prop:filedialoghook
    prop:files
    prop:filesize
    prop:fill
    prop:fillcolor
    prop:filter
    prop:first
    prop:flat
    prop:flushpreview
    prop:follows
    prop:font
    prop:fontcharset
    prop:fontcolor
    prop:fontdialoghook
    prop:fontname
    prop:fontsize
    prop:fontstyle
    prop:format
    prop:from
    prop:full
    prop:fullbuild
    prop:globalhelp
    prop:grabhandles
    prop:gray
    prop:halthook
    prop:handle
    prop:hdbc
    prop:headerheight
    prop:height
    prop:held
    prop:henv
    prop:hide
    prop:hint
    prop:hlp
    prop:hscroll
    prop:hscrollpos
    prop:hstmt
    prop:icon
    prop:iconize
    prop:iconlist
    prop:imagebits
    prop:imageblob
    prop:imageinstance
    prop:imm
    prop:initastringhook
    prop:inner
    prop:ins
    prop:intoolbar
    prop:isolationlevel
    prop:isradio
    prop:items
    prop:join
    prop:joinexpression
    prop:key
    prop:keys
    prop:label
    prop:landscape
    prop:language
    prop:last
    prop:lasteventname
    prop:lazydisplay
    prop:left
    prop:leftoffset
    prop:lfnsupport
    prop:libhook
    prop:libversion
    prop:license
    prop:line
    prop:linecount
    prop:lineheight
    prop:linewidth
    prop:link
    prop:listfeq
    prop:log
    prop:logfile
    prop:logintimeout
    prop:logonscreen
    prop:logout
    prop:mark
    prop:mask
    prop:max
    prop:maxheight
    prop:maximize
    prop:maxstatements
    prop:maxwidth
    prop:mdi
    prop:memos
    prop:messagehook
    prop:meta
    prop:min
    prop:minheight
    prop:minwidth
    prop:mm
    prop:modal
    prop:msg
    prop:name
    prop:nextfield
    prop:nextpageno
    prop:nobar
    prop:nocase
    prop:noframe
    prop:noheight
    prop:nomerge
    prop:nosheet
    prop:notips
    prop:nowidth
    prop:numtabs
    prop:object
    prop:oem
    prop:ole
    prop:open
    prop:opt
    prop:order
    prop:orderalltables
    prop:orderinselect
    prop:over
    prop:ovr
    prop:owner
    prop:page
    prop:pageafter
    prop:pageafternum
    prop:pagebefore
    prop:pagebeforenum
    prop:pageno
    prop:palette
    prop:parent
    prop:password
    prop:paste
    prop:pastelink
    prop:pixels
    prop:places
    prop:points
    prop:positionblock
    prop:preview
    prop:primary
    prop:printerdialoghook
    prop:printmode
    prop:profile
    prop:profileintofiles
    prop:progid
    prop:progress
    prop:progressevents
    prop:quotestring
    prop:range
    prop:rangehigh
    prop:rangelow
    prop:readonly
    prop:reclaim
    prop:rejectcode
    prop:release
    prop:repeat
    prop:reportexception
    prop:req
    prop:reset
    prop:resize
    prop:right
    prop:rightoffset
    prop:round
    prop:saveas
    prop:screentext
    prop:scroll
    prop:selected
    prop:selectedcolor
    prop:selectedfillcolor
    prop:selectinterface
    prop:selend
    prop:selstart
    prop:separate
    prop:single
    prop:size
    prop:sizemode
    prop:skip  
    prop:snapheight
    prop:snapwidth
    prop:spread
    prop:sql
    prop:sqldriver
    prop:sqlfilter
    prop:sqljoinexpression
    prop:sqlorder
    prop:status
    prop:statustext
    prop:std
    prop:step
    prop:stophook
    prop:stretch
    prop:sum
    prop:supportsop
    prop:supportstype
    prop:system
    prop:systemprophook
    prop:tabrows
    prop:tally
    prop:target
    prop:tempimage
    prop:tempimagepath
    prop:tempnamefunc
    prop:temppagepath
    prop:temppath
    prop:text
    prop:textalign
    prop:thous
    prop:thread
    prop:threading
    prop:tiled
    prop:tileimage
    prop:timer
    prop:tip
    prop:tipdelay
    prop:tipdisplay
    prop:together
    prop:toolbox
    prop:tooltip
    prop:touched
    prop:trn
    prop:truevalue
    prop:type
    prop:up
    prop:update
    prop:upr
    prop:upsidedown
    prop:use
    prop:value
    prop:vbxevent
    prop:vbxeventarg
    prop:vbxfile
    prop:vbxname
    prop:vcr
    prop:vcrfeq
    prop:visible
    prop:vlbproc
    prop:vlbval
    prop:vscroll
    prop:vscrollpos
    prop:wallpaper
    prop:watched
    prop:where
    prop:width
    prop:windowui
    prop:withnext
    prop:withprior
    prop:wizard
    prop:wndproc
    prop:xorigin
    prop:xpos
    prop:yorigin
    prop:ypos
    prop:zoom
    proplist:backcolor
    proplist:backselected
    proplist:barcolor
    proplist:cellstyle
    proplist:center
    proplist:centeroffset
    proplist:color
    proplist:colstyle
    proplist:decimal
    proplist:decimaloffset
    proplist:defcolors
    proplist:exists
    proplist:fieldno
    proplist:fixed
    proplist:format
    proplist:grid
    proplist:group
    proplist:groupno
    proplist:header
    proplist:headercenter
    proplist:headercenteroffset
    proplist:headerdecimal
    proplist:headerdecimaloffset
    proplist:headerleft
    proplist:headerleftoffset
    proplist:headerright
    proplist:headerrightoffset
    proplist:icon
    proplist:icontrn
    proplist:lastonline
    proplist:left
    proplist:leftoffset
    proplist:locator
    proplist:mousedownfield
    proplist:mousedownrow
    proplist:mousedownzone
    proplist:mousemovefield
    proplist:mousemoverow
    proplist:mousemovezone
    proplist:mouseupfield
    proplist:mouseuprow
    proplist:mouseupzone
    proplist:picture
    proplist:resize
    proplist:resvd2
    proplist:resvd3
    proplist:right
    proplist:rightborder
    proplist:rightoffset
    proplist:scroll
    proplist:style
    proplist:textcolor
    proplist:textselected
    proplist:tree
    proplist:treeboxes
    proplist:treeindent
    proplist:treelines
    proplist:treeoffset
    proplist:treeroot
    proplist:underline
    proplist:width
    propstyle:backcolor
    propstyle:backselected
    propstyle:charset
    propstyle:first
    propstyle:fontcolor
    propstyle:fontname
    propstyle:fontsize
    propstyle:fontstyle
    propstyle:last
    propstyle:picture
    propstyle:textcolor
    propstyle:textselected
    reject:invalid
    reject:range
    reject:rangehigh
    reject:rangelow
    std:arrangeicons
    std:cascadewindow
    std:clear
    std:close
    std:copy
    std:cut
    std:help
    std:helpindex
    std:helponhelp
    std:helpsearch
    std:paste
    std:printsetup
    std:tilehorizontal
    std:tilevertical
    std:tilewindow
    std:undo
    std:windowlist
    true
    vbxevent:click
    vbxevent:dblclick
    vbxevent:gotfocus
    vbxevent:keydown
    vbxevent:keypress
    vbxevent:keyup
    vbxevent:lostfocus
    vbxevent:mousedown
    vbxevent:mousemov
    vbxevent:mouseup
! :lexClass
! 
! lexClass: 
!     name          = CW_DataTypes
!     parent        = C_CW  
!     caseSensitive = 0
!     ParseOnScreen = 0
!     txt:Bold      = 0
!     token:start:separators = ' ', '\t','*', '(', '[','-', @eol, ',','<' 
!     token:end:separators   = ' ', '\t',')',']', @eol , ',' , '(' , ',' , '>' 
!     txt:colorFG = 0xFF0000                               ! //Red; change color here  
    any
    bfloat4
    bfloat8
    byte
    blob
    bool
    cstring
    decimal
    real
    string
    ulong
    long
    short
    ushort
    signed
    unsigned
    !*
    cstring
!    DisplayName = 'CW Data structures'
!:lexClass 
!
!lexClass:                                                 ! //Class Completed:x
!    name          = CW_API_DataTypes
!    parent        = C_CW  
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    token:start:separators = ' ', '\t','*', '(', '[','-', @eol, ',','<' 
!    token:end:separators   = ' ', '\t',')',']', @eol , ',' , '(' , ',' , '>' 
!    txt:colorFG   = 0xFF3300                              ! //Red; change color here

    DWord
    LptStr
    LpDword
    HKey
    LpCStr
    LpCtStr



!    DisplayName   = 'API Data structures'
!:lexClass 
!
!lexClass:                                                 ! //Class Completed:x
!    name          = CW_Strings
!    parent        = C_CW
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    start:tag     = '\''
!    end:tag       = '\''
!    txt:colorFG   = 0x848F44                               ! //Gray; change color here
!    DisplayName   = 'CW Text Strings'
!:lexClass
!
!lexClass:                                                  ! //Class Completed:x
!    name       = CW_Comments
!    parent        = C_CW
!    caseSensitive = 0
!    ParseOnScreen = 0
!    txt:Bold      = 0
!    start:Tag     = '!'
!    end:tag       = @eol
!    txt:colorFG   = 0x0f9f00                               ! //Forest green; change color here
!    DisplayName   = 'CW Comments'
!:lexClass  
!
