$(document).ready(function () {

    !function (window, document) {

        setTimeout(function () {

            var $confirmAdd = $(".confirm-add");
            $confirmAdd.animate({
                marginTop: 0,
                opacity: 1
            }, 300);

            $confirmAdd.on('click', function (e) {
                var $targetEle = $(e.target);
                if ($targetEle.hasClass('confirm-close') || $targetEle.hasClass('cancal-btn')) {
                    $confirmAdd.animate({
                        marginTop: -50 + '%',
                        opacity: 0
                    }, 300);
                }
                if ($targetEle.hasClass('centain-btn')) {
                    $confirmAdd.animate({
                        marginTop: -50 + '%',
                        opacity: 0
                    }, 300);

                    $.ajax({
                        url: 'json.json',
                        type: 'get',
                        dataType: 'json',
                        success: function (data) {
                            mainCode(data.songs);
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });

                }
            });

        }, 500);

        function mainCode(data) {

            var globalPlayFlag = true;

            var audio = $('audio').get(0),
                $doc = $('html,body'),
                $playerContainer = $('.player-container');//播放器界面主体

            var $musicListNum = $('.musicList-num>span'),//播放列表主体区
                $musicListBody = $('.musicList-body'),//播放列表区中的歌曲总数显示区
                $musicListClearAll = $('.musicList-clearAll');

            var $musicPlaybill = $('.singer-headshot>img'),//海报图片
                $musicHeadline = $('.music-headline'),//音乐名字
                $musicSinger = $('.singer-name-cur'),//歌手名字
                $musicAlbum = $('.album-name-cur'),//专辑名字
                $musicLyric = $('.music-lyric-list'),//歌词展示区
                $lyricTimeVal = $('.lyricTimeVal'),//歌词显示区拖动展示的时间
                $smallPlayIcon = $('.small-play-icon'),//歌词显示区拖动展示的播放按钮
                $lyricTimeLine = $('.lyricTimeLine'),//实时时间线
                $fullscreenBtn = $('.fullscreen-btn');

            var $progressbar = $('.play-progressbar'),//播放进度条
                $progressbarCur = $progressbar.find('.play-cur-progressbar'),//实时播放进度条
                $progressbarCurDot = $progressbar.find('.time-schedule'),
                $volumebar = $('.volume-bar'),//音量条
                $volumebarCur = $volumebar.find('.volume-cur-bar'),//实时音量条
                $volumebarCurDot = $volumebar.find('.dynamic-btn');

            var $musicPlaybillSmall = $('.playbill-small'),
                $byOrder = $('.by-order'),//播放顺序按钮
                $playPauseBtn = $('.global-audio-ctrl'),//底部中央暂停-播放按钮
                $curTime = $('.cut-time'),//currenttime显示区
                $fixedTime = $('.fixed-time'),//duration显示区
                $footctrlSinger = $('.footctrl-singer'),
                $footctrlMusic = $('.footctrl-music'),
                $volumeIcon = $('.volume-icon'),
                $nextMusic = $('.next-music'),
                $prevMusic = $('.prev-music');

            var progressbar = new Progressbar($progressbar, $progressbarCur, $progressbarCurDot),//播放进度条方法
                player = new Player(data, audio, {
                    $byOrder: $byOrder
                }),//媒体文件播放方法
                volumesbar = new Progressbar($volumebar, $volumebarCur, $volumebarCurDot),//音量条方法
                lyriccontent = null;//歌词方法


            //如果播完了，就自动开始下一首
            function audioEnded() {
                player.autoSwitchLogic({
                    circulatePlay: 'circulate-order',
                    randomPlay: 'random-order',
                    forwardPlay: 'in-order'
                });
                loadCurMusicInfo(data[player.playIndex]);
            }
            audio.addEventListener('ended', audioEnded);

            //插入播放列表子项
            appendList();
            function appendList() {
                var liArr = [];
                $.each(data, function (i, e) {
                    var newMusicLi = '<li>\
                                        <h4 class="musicList-name-detail">'+ e.music + '\
                                            <i class="jump-animate"></i>\
                                        </h4>\
                                        <div class="musicList-info-detail">\
                                            <em class="musicList-singer-detail">'+ e.singer + '</em>\
                                            <div class="musicList-music-details">\
                                                <span class="musicList-time-detail">'+ e.totalTime + '</span>\
                                                <div class="musicList-ctrl-icon">\
                                                    <i class="smallLi-play-icon play-paused-btn"></i>\
                                                    <i class="musicList-del" title="删除"></i>\
                                                </div>\
                                            </div>\
                                        </div>\
                                      </li >\n';
                    liArr.push(newMusicLi);
                });
                $musicListBody.html(liArr.join(''));
                $musicListNum.text(data.length);
            }

            var $smallLiPlayIcon = null,
                $musicList = null;

            updateEle();
            function updateEle() {
                $smallLiPlayIcon = $musicListBody.find('.smallLi-play-icon');//歌词区小图标（播放/暂停）
                $musicList = $musicListBody.children();//歌词列表list
            }

            //加载对应资源信息（如专辑海报、背景图、专辑名、歌手名等实时信息）
            loadCurMusicInfo(data[0])
            function loadCurMusicInfo(item) {
                //获取索引
                var index = data.indexOf(item);
                //设置歌曲海报
                $musicPlaybill.attr('src', item.playbill);
                $musicPlaybillSmall.css('background-image', 'url("' + item.playbill + '")');
                //设置音乐名称
                $musicHeadline.text(item.music);
                $footctrlMusic.text(item.music);
                //设置音乐歌手
                $musicSinger.text(item.singer);
                $footctrlSinger.text(item.singer);
                //设置音乐专辑
                $musicAlbum.text(item.album);
                //设置音乐总时间 
                $fixedTime.text(item.totalTime);
                //设置暂停-播放图标为播放样式
                $playPauseBtn.removeClass('paused').addClass('played');
                $playPauseBtn.attr('title', '暂停');
                //设置音频url链接地址
                audio.setAttribute('src', item.url);
                //播放音频
                audio.play();
                //加载歌词
                lyriccontent = new Lyric(data[index].lyric, $musicLyric, 'current-display');
                $musicList.eq(index).addClass('boom-animate').siblings().removeClass('boom-animate');//给对应的歌曲列表子项添加正在播放动态效果
                $smallLiPlayIcon.each(function (i) {
                    var $this = $(this);
                    if (i === index) {
                        $this.removeClass('paused').addClass('played');
                        $this.attr('title', '暂停');
                    } else {
                        $(this).removeClass('played').addClass('paused');
                        $this.attr('title', '播放');
                    }
                });
            }

            //播放进度条相关事件：点击、拖移，以及播放进度监听事件
            progressRelative();
            function progressRelative() {
                function progressbarCb(currentRatio) {
                    if (!globalPlayFlag) return;
                    //点击小播放按钮时，先关后歌词区按下-移动-松开事件后设置的定时器
                    clearTimeout($musicLyric.timeOut);
                    //隐藏时间线区
                    $lyricTimeLine.css('visibility', 'hidden');
                    //声明现在没有进行歌词区移动操作了
                    lyriccontent.isMouseDown = false;
                    player.setPlayTime(currentRatio);//设置对应的播放进度
                    lyriccontent.shiftLyricBox(player.audio.currentTime, player.audio.duration);//歌词跳到对应的显示位置
                    if (player.audio.paused) {
                        player.audio.play();
                        player.$playPauseBtn.removeClass('paused').addClass('played');
                    }//如果音频本来是暂停的，就让它播放
                }
                progressbar.progressbarClick(progressbarCb);
                progressbar.progressbarDrag(progressbarCb);
                player.timeProgressListener(function (playRatio, curFormatTime) {
                    if (!globalPlayFlag) return;
                    $curTime.text(curFormatTime);//实时设置currentTime的显示值（00：00格式）
                    //实时设置进度条宽度、歌词显示位置
                    if (progressbar.isMove) {
                        progressbar.setProgressCurSite(playRatio);
                        lyriccontent.shiftLyricBox(player.audio.currentTime, player.audio.duration);
                    }
                });
            }

            //音量相关
            volumeRelative();
            function volumeRelative() {
                //初始化音量强度为一半
                var volumesbarW = $volumebar.outerWidth(),
                    mediumVal = (1 / 2) * volumesbarW * (volumesbarW - $volumebarCurDot.outerWidth()) / volumesbarW;
                audio.volume = 0.5;
                $volumebarCur.css('width', mediumVal + 'px');
                $volumebarCurDot.css('left', mediumVal + 'px');

                //音量条相关事件：即点击和拖移事件
                var prevVolume = 0;//记录变成静音前的volume值
                $volumeIcon.on('click', function () {
                    var $this = $(this);
                    if ($this.hasClass('muted')) {
                        $this.removeClass('muted');
                        player.audio.volume = prevVolume;
                        volumesbar.setProgressCurSite(prevVolume);
                    } else {
                        prevVolume = player.audio.volume;
                        $this.addClass('muted');
                        player.audio.volume = 0;
                        volumesbar.setProgressCurSite(0);
                    }
                });

                function voiceAttrSwitch(currentRatio) {
                    if (!globalPlayFlag) return;
                    player.setPlayVoice(currentRatio);
                    player.audio.volume === 0 ? $volumeIcon.addClass('muted') : $volumeIcon.removeClass('muted');
                }

                volumesbar.progressbarClick(function (currentRatio) {
                    voiceAttrSwitch(currentRatio);
                });
                volumesbar.progressbarDrag(null, function (currentRatio) {
                    voiceAttrSwitch(currentRatio);
                });

            }

            //暂停与播放事件
            function playpausedEvent() {
                if (!globalPlayFlag) return;

                var curSmallLiPlayIcon = $smallLiPlayIcon.eq(player.playIndex);
                player.setPlayPaused([
                    $playPauseBtn,
                    curSmallLiPlayIcon
                ], {
                    paused: 'paused',
                    played: 'played'
                });
                if (player.audio.paused) {
                    curSmallLiPlayIcon.parents('li').find('.jump-animate').css('opacity', 0);
                } else {
                    curSmallLiPlayIcon.parents('li').find('.jump-animate').css('opacity', 1);
                }
            }
            //暂停与播放事件————全局暂停/播放按钮点击
            $playPauseBtn.on('click', function () {
                playpausedEvent();
            });

            //音乐切换逻辑
            switchLogic();
            function switchLogic() {
                //点击前后切换按钮以及切换顺序按钮的切换逻辑
                var switchArr = [
                    { order: 'in-order', title: '顺序' },
                    { order: 'random-order', title: '随机' },
                    { order: 'circulate-order', title: '单曲循环' }
                ];

                var orderIndex = 0;
                $byOrder[0].classList.add(switchArr[0].order);
                $byOrder[0].setAttribute('title', switchArr[orderIndex].title);
                $byOrder.on('click', function () {//切换顺序
                    this.classList.remove(switchArr[orderIndex].order);
                    orderIndex++;
                    orderIndex >= switchArr.length && (orderIndex = 0);
                    this.classList.add(switchArr[orderIndex].order);
                    this.setAttribute('title', switchArr[orderIndex].title);
                });
                $nextMusic.on('click', function () {//下一首
                    if (!globalPlayFlag) return;

                    player.clickSwitchLogic({
                        randomPlay: 'random-order',
                        whichWayPlay: 'next'
                    });
                    loadCurMusicInfo(data[player.playIndex]);
                });
                $prevMusic.on('click', function () {//上一首
                    if (!globalPlayFlag) return;

                    player.clickSwitchLogic({
                        randomPlay: 'random-order',
                        whichWayPlay: 'prev'
                    });
                    loadCurMusicInfo(data[player.playIndex]);
                });

                function playPausedTab(target) {
                    player.lrcLiClickSwitchEffect(target, playpausedEvent, function () {
                        loadCurMusicInfo(data[player.playIndex]);
                    });
                }
                //双击播放列表中的曲目时的切换逻辑
                $musicListBody.on('dblclick', 'li', function () {
                    playPausedTab($(this));
                });
                //点击歌词列表中的播放/暂停按钮的切换逻辑
                $musicListBody.on('click', '.smallLi-play-icon', function () {
                    playPausedTab($(this).parents('li'));
                });

            }

            //歌词区操作
            lrcMouseMove();
            function lrcMouseMove() {
                var beginY = 0,
                    curY = 0,
                    moveY = 0;
                //歌词区的鼠标按下-移动-松开事件
                $musicLyric.on('mousedown', function (e) {
                    if (!globalPlayFlag) return;

                    if (e.button === 0) {
                        var curTopVal = parseInt($musicLyric.css('marginTop'));//获取按下鼠标时，歌词区的top值
                        beginY = e.pageY;
                        moveY = curTopVal;//设置初始moveY值为该top值
                        lyriccontent.isMouseDown = true;//表明现在正在进行按下-移动-松开事件操作
                        clearTimeout($musicLyric.timeOut);
                        $lyricTimeLine.css('visibility', 'visible');//让两侧时间线区显示
                        $lyricTimeVal.text(lyriccontent.getAdaptTime(moveY).formatTime);//设置按下鼠标时的坐标对应的歌词所对应的歌曲时间

                        $doc.on('mousemove', function (e) {
                            curY = e.pageY;
                            moveY += curY - beginY;
                            beginY = curY;
                            //限制歌词区移动top值的上限与下限
                            if (moveY > lyriccontent.allLiTopArr[0]) {
                                moveY = lyriccontent.allLiTopArr[0];
                            } else if (moveY < lyriccontent.allLiTopArr[lyriccontent.allLiTopArr.length - 1]) {
                                moveY = lyriccontent.allLiTopArr[lyriccontent.allLiTopArr.length - 1];
                            }
                            //歌词区移动时，实时设置它的top值，以达到移动效果
                            $musicLyric.css({
                                'transition': 0 + 's',
                                'marginTop': moveY + 'px'
                            });
                            //歌词区移动时，同时实时设置强调歌词的时间
                            $lyricTimeVal.text(lyriccontent.getAdaptTime(moveY).formatTime);
                        });

                        $doc.on('mouseup', function () {
                            $doc.off('mousemove');
                            /*建议开启一个定时器之前一定要关掉前一个定时器*/
                            clearTimeout($musicLyric.timeOut);
                            //松开时，开启一个在4秒后只执行一次的定时器。如果在这4秒期间没点击小播放图标，就让歌词区位置依然随着歌曲播放进度变化而变化
                            $musicLyric.timeOut = setTimeout(function () {
                                $lyricTimeLine.css('visibility', 'hidden');
                                $musicLyric.css({
                                    'transition': '.3s',
                                    'marginTop': curTopVal + 'px'
                                })
                                lyriccontent.isMouseDown = false;//松开后四秒后，将取消按下-移动-松开事件判断，表明歌词区现在没有进行移动操作了
                                $doc.off('mouseup');
                            }, 4000);
                        });
                    }
                });

                //歌词区小播放按钮点击事件
                $smallPlayIcon.on('click', function () {
                    if (!globalPlayFlag) return;

                    //点击小播放按钮时，先关后歌词区按下-移动-松开事件后设置的定时器
                    clearTimeout($musicLyric.timeOut);
                    //隐藏时间线区
                    $lyricTimeLine.css('visibility', 'hidden');
                    //声明现在没有进行歌词区移动操作了
                    lyriccontent.isMouseDown = false;
                    //再设置要播放的时间进度
                    player.audio.currentTime = lyriccontent.getAdaptTime(moveY).secondsTime;
                    if (player.audio.paused) {
                        player.audio.play();
                        player.$playPauseBtn.removeClass('paused').addClass('played');
                    }
                });
            }


            //点击清空列表按钮事件
            function clearAllSongs() {

                globalPlayFlag = false;

                $musicPlaybill.attr('src', '');
                $musicPlaybillSmall.css('background-image', 'url()');
                $footctrlMusic.text('');
                $musicSinger.text('');
                $footctrlSinger.text('');
                $musicAlbum.text('');
                $musicListNum.text('0');//清零音乐列表歌曲显示数量
                $fixedTime.text('00:00');//清零音乐总时间  
                $curTime.text('00:00');//清零音乐实时时间          
                $playPauseBtn.removeClass('played').addClass('paused');//设置暂停-播放图标为播放样式
                $playPauseBtn.attr('title', '');
                audio.setAttribute('src', '');//设置音频url链接地址

                $musicListBody.empty();
                $musicLyric.html('小果音乐，让生活充满音乐~~');
                $musicHeadline.html('小果音乐，让生活充满音乐~~');
                $progressbarCur.css({
                    'width': 0,
                    'left': 0
                });
                $progressbarCurDot.css('left', '-100%');
                data = [];
            }
            $musicListClearAll.on('click', clearAllSongs);

            $musicListBody.on('click', '.musicList-del', function () {
                var $target = $(this).parents('li'),
                    dataLastIndex = data.length - 1,
                    $curPlayLi = $musicList[player.playIndex],
                    playClickIndex = $target.index();
                $target.remove();
                data.splice(playClickIndex, 1);
                updateEle();//更新相关元素
                $musicListNum.text(dataLastIndex);
                if (playClickIndex === player.playIndex) {
                    if (playClickIndex >= dataLastIndex) {
                        if(dataLastIndex === 0){
                            clearAllSongs();
                            return;
                        }
                        player.playIndex = 0;
                    }
                    loadCurMusicInfo(data[player.playIndex]);
                } else {
                    player.playIndex = jQuery.inArray($curPlayLi, $musicList.toArray());
                }
            });

            //键盘事件
            $(document).on('keyup', function (e) {
                //如果是空格键
                if (e.which === 32 || e.keyCode === 32) {
                    playpausedEvent();
                    //如果是esc键
                } else if (e.which === 27 || e.keyCode === 27) {
                    $playerContainer.toggleClass('slidedown');
                }
            });


            $musicPlaybillSmall.on('click', function () {
                $playerContainer.toggleClass('slidedown');
            });
            $fullscreenBtn.on('click', function () {
                $playerContainer.addClass('slidedown');
            });

        }

    }(window, document);

});
