IDEAL
MODEL small
STACK 100h

DATASEG
	testText db "Testing",10,".",10,".",10,"$"
	testArray dw 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
	
	;cannon related
	;------------------------------------------------
	lives dw 3
	cannonX dw 144
	cannonY dw 180
	cannonSpeed dw 2
	cannonHeight dw 8
	cannonWidth dw 13
	cannonAnimationPose dw 0
	;------------------------------------------------
	;Bullet
	;------------------------------------------------
	smokeInTheAir dw 0 ; 1 or 0 depends on if theres a cannon bullet is allready fired
	startingPoint dw 6 ;half of cannonWidth
	bulletHeight dw 6
	bulletWidth dw 0
	bulletX dw 0
	bulletY dw 0
	bulletSpeed dw 1
	;------------------------------------------------
	
	;Enemies Related
	;------------------------------------------------
	numOfEnemies dw 0
	FireEveryN dw 500
	enemyAnimationPose dw 0 ;controls the state of the animation of the enemy
	offsetOfAnimation dw ?
	maxEnemyX dw 0
	minEnemyX dw 0
	enemyProjectile1X dw 0
	enemyProjectile1Y dw 0
	enemyProjectile2X dw 0
	enemyProjectile2Y dw 0
	enemyProjectile3X dw 0
	enemyProjectile3Y dw 0
	enemyProjectile1Speed dw 0
	enemyProjectile2Speed dw 0
	enemyProjectile3Speed dw  0
	pickle1 dw 0 ;used to determine if the enemies shot a projectile
	pickle2 dw 0
	pickle3 dw 0
	LOCKED dw 0
	enemyClusterMovementCounter dw 0
	enemyClusterMovementSpeed dw 1000 ;the higher the slower
	enemyClusterX dw 20
	enemyClusterY dw 20
	enemyClusterXDelta dw 5
	enemyClusterYDelta dw 8
	enemyHeight dw 8
	enemyWidth dw 12
	enemyHeightPlus dw 10
	enemyWidthPlus dw 14
	enemyMoveDirection dw 1 ;1 = right 0 = left
	enemiesArray dw 1,3,4,16,3,4,31,3,4,46,3,4,61,3,4,76,3,4,91,3,4,106,3,4,121,3,4,136,3,4,151,3,4,166,3,4,181,3,4,196,3,4,211,3,4,1,19,4,16,19,4,31,19,4,46,19,4,61,19,4,76,19,4,91,19,4,106,19,4,121,19,4,136,19,4,151,19,4,166,19,4,181,19,4,196,19,4,211,19,4,1,35,4,16,35,4,31,35,4,46,35,4,61,35,4,76,35,4,91,35,4,106,35,4,121,35,4,136,35,4,151,35,4,166,35,4,181,35,4,196,35,4,211,35,4,1,51,4,16,51,4,31,51,4,46,51,4,61,51,4,76,51,4,91,51,4,106,51,4,121,51,4,136,51,4,151,51,4,166,51,4,181,51,4,196,51,4,211,51,4,1,67,4,16,67,4,31,67,4,46,67,4,61,67,4,76,67,4,91,67,4,106,67,4,121,67,4,136,67,4,151,67,4,166,67,4,181,67,4,196,67,4,211,67,4,0
	;------------------------------------------------
	
	;Colors
	;-------------------------------------------------
	black dw 00h
	white dw 0Fh
	blackOrWhite dw 00h
	;-------------------------------------------------
	
	;Sprites
	;-------------------------------------------------
	fighterPose1 dw 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h,00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h,00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h,00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h,0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 00h,0Fh, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 0Fh, 00h,00h, 00h, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h, 00h, 00h
	fighterPose2 dw 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h,0Fh, 00h, 00h, 0Fh, 00h, 00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h,0Fh, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 00h,0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 0Fh, 00h,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h,00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h,00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h,00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h
	largeInvaderPose1 dw 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h,00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,00h, 00h, 0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh, 00h, 00h,00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 00h,00h, 00h, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 00h, 00h
	largeInvaderPose2 dw 00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h,00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,0Fh, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 0Fh,0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh,00h, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 00h,00h, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h,0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh
	smallInvaderPose1 dw 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h,00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h,00h, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h,00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h,00h, 00h, 00h, 0Fh, 00h, 0Fh, 0Fh, 00h, 0Fh, 00h, 00h, 00h,00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h,00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h
	smallInvaderPose2 dw 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h, 00h,00h, 00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h, 00h,00h, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 0Fh, 0Fh, 00h, 00h,00h, 00h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 00h, 00h,00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h,00h, 00h, 00h, 0Fh, 00h, 0Fh, 0Fh, 00h, 0Fh, 00h, 00h, 00h,00h, 00h, 0Fh, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 0Fh, 00h, 00h
	cannonSprite dw 00h, 00h, 00h, 00h, 00h, 00h, 0Ah, 00h, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 00h, 0Ah, 0Ah, 0Ah, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 00h, 0Ah, 0Ah, 0Ah, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 00h, 0Ah, 0Ah, 0Ah, 00h, 00h, 00h, 00h, 00h,00h, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah
	bombSprite dw 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 04h
	enemyExplosion dw 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h,00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h, 0Fh,00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 00h, 0Fh, 00h,0Fh, 0Fh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 0Fh,00h, 0Fh, 00h, 0Fh, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h,0Fh, 00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h, 0Fh, 00h, 00h,00h, 00h, 00h, 00h, 00h, 00h, 0Fh, 00h, 00h, 00h, 00h, 00h
	cannonSpriteDestroyed1 dw 00h, 00h, 00h, 0Ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,00h, 0Ah, 00h, 00h, 00h, 00h, 0Ah, 00h, 00h, 0Ah, 00h, 00h, 00h,00h, 00h, 00h, 0Ah, 00h, 0Ah, 00h, 00h, 0Ah, 00h, 0Ah, 00h, 00h,00h, 0Ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0Ah, 00h,00h, 00h, 00h, 00h, 0Ah, 00h, 0Ah, 0Ah, 00h, 00h, 00h, 00h, 00h,0Ah, 00h, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h, 00h, 00h,00h, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h, 00h,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h
	cannonSpriteDestroyed2 dw 00h, 00h, 00h, 00h, 00h, 00h, 0Ah, 00h, 00h, 00h, 00h, 0Ah, 00h,0Ah, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h,00h, 00h, 00h, 0Ah, 00h, 00h, 0Ah, 00h, 00h, 00h, 00h, 0Ah, 00h,00h, 0Ah, 00h, 00h, 00h, 0Ah, 00h, 00h, 00h, 0Ah, 00h, 00h, 0Ah,00h, 00h, 00h, 00h, 0Ah, 0Ah, 00h, 0Ah, 00h, 00h, 00h, 00h, 00h,0Ah, 00h, 00h, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h, 00h, 0Ah, 00h,00h, 00h, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h, 00h, 00h,0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah, 00h
	enemyProjectileSprite dw 00h, 0Fh, 00h,00h, 00h, 0Fh,00h, 0Fh, 00h,0Fh,  00h,00h, 00h, 0Fh

	drawBackground dw 1
	;-------------------------------------------------
	
	;randomness related
	;-------------------------------------------------
	loopDeterminator dw 0
	randomEnemy dw 0
	randomNumber dw 0
	randomnessCounter dw 0
	oldTime db 0
	;-------------------------------------------------
	
	;texts
	;-------------------------------------------------
	starting_screen_text db "SPACE INVADERS", 10,10, "Your goal is to defend your Mothership", 10, 10 , "from the enemy , move your cannon with", 10, 10 , "the A and D keys, and shoot the enemies", 10, 10 , "using the L key. If the enemies have", 10, 10 , "reached the bottom or you died 3 times,", 10, 10 , "you'll lose the game!", 10, 10,10, "Made by Liam Ichai", 10,10,10, "- Press a key to start the game -$"
	WinnerText db "Winner WInner, Chicken Dinner", 10, 10, "Great job at destroying all those", 10, 10 , "enemies!", 10, 10 , "Go do homework instead of playing Games", 10, 10 , ":/$"
	LoserText db "You Lost!", 10, 10 , "Your lacking some.... skill  :/$"
	scoreText db "Score: "
	;-------------------------------------------------
	
	;Notes
	;-------------------------------------------------
	noteStep dw 0
	noteC2 dw 16000
	shootNote dw 800
	note1 dw 20000
	note2 dw 20500
	note3 dw 21000
	note4 dw 21500
	;-------------------------------------------------
	
CODESEG

proc graphicMode ;Literally graphic mode
	push ax
	mov ax, 13h
	int 10h
	
	pop ax
	ret
endp

proc testRect
	push 28h
	push 30
	push 70
	push 0
	push 0
	call drawRect
	ret
endp

proc Pixel ;paints the pixel
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	
	mov ah, 0Ch
	mov bh, 0
	mov cx, [bp + 4]
	mov dx, [bp + 6]
	mov al, [bp + 8]
	int 10h
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
endp

proc readPixel
	push bp
	mov bp, sp
	push bx
	push cx
	push dx
	
	mov ah, 0Dh
	mov bh, 0
	mov cx, [bp + 4]
	mov dx, [bp + 6]
	int 10h
	
	
	pop dx
	pop cx
	pop bx
	pop bp
	ret 4
endp

proc beep
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	
	in  al, 61h
	or al, 00000011b
	out 61h, al
	
	mov al, 0B6h
	out 43h, al
	
	mov ax, [bp + 4]
	out 42h, al
	mov al, ah
	out 42h, al
	
	pause1:
		mov cx, 65535
	pause2:
		dec cx
		cmp cx, 0
		jne pause2
		dec bx
		cmp bx, 0
		jne pause1
		in al, 61h
		
		and al , 11111100b
		out 61h, al
	
	pop cx
	pop bx
	pop ax
	pop bp
	ret 2
endp

proc stopBeep
	push ax
	
	in al, 61h
	and al, 11111100b
	out 61h, al
	
	pop ax
	ret
endp

proc waitTenth
	push ax
	xor ax, ax
	waitTenthLoop:
	inc ax
	cmp ax, 32000
	jl waitTenthLoop

	pop ax
	ret
endp

proc drawRect ;a place holder until drawEnemySprite and drawCanonSprite
	push bp
	mov bp, sp
	push ax
	push bx
	push cx
	push dx
	
	mov ax, [bp + 4] ;xpos
	mov bx, [bp + 6] ;ypos
	mov dl, [bp + 8] ;width
	mov dh, [bp + 10];height
	
	xor cx, cx
	Xrect:
		mov ax, [bp + 4]
		mov cl, 0
		pixelRect:
			push [bp + 12]
			push bx
			push ax
			call Pixel
			inc ax
			inc cl
			cmp cl, dl
			jle pixelRect
			inc bx
			inc ch
			cmp ch, dh
			jle Xrect

	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 10
endp

proc drawBasicBackground
	push 0Ah		;top green line cant draw more then width 100 so it is split into 3 segments
	push 0
	push 110
	push 20
	push 0
	call drawRect
	push 0Ah
	push 0
	push 110
	push 20
	push 110
	call drawRect
	push 0Ah
	push 0
	push 99
	push 20
	push 220
	call drawRect
	
	push 0Ah		;bottom green line cant draw more then width 100 so it is split into 3 segments
	push 0
	push 110
	push 199
	push 0
	call drawRect
	push 0Ah
	push 0
	push 110
	push 199
	push 110
	call drawRect
	push 0Ah
	push 0
	push 99
	push 199
	push 220
	call drawRect
	
	
	mov [cannonX], 200
	mov [cannonY], 5
	push offset cannonSprite
	call drawCannon
	
	cmp [lives], 2
	jl drawBasicBackgroundEnd
	mov [cannonX], 220
	mov [cannonY], 5
	push offset cannonSprite
	call drawCannon
	
	cmp [lives], 3
	jl drawBasicBackgroundEnd
	mov [cannonX], 240
	mov [cannonY], 5
	push offset cannonSprite
	call drawCannon
	
	
	drawBasicBackgroundEnd:
	mov [cannonX], 150
	mov [cannonY], 180
	ret
endp

proc drawEnemySprite ;gets a specific array to draw a specific enemy
	push si
	push bp
	mov bp, sp
	mov si, [bp + 6]
	push ax
	push bx
	push cx
	push dx

	mov cx, [bp + 8] ;xpos
	mov dx, [bp + 10] ;ypos
	mov ax, cx
	add ax, [enemyWidth]
	mov bx, dx
	add bx, [enemyHeight]
	drawEnemySpriteLoop:
		cmp dx, bx
		jge drawEnemySpriteEnd
		mov cx, ax
		sub cx, [enemyWidth]
		drawEnemySpriteLoopY:
			cmp cx, ax
			jge drawEnemySpriteIncY
			cmp [drawBackground], 1
			je drawEnemySpriteDrawPixel
			cmp [si], ch ;because ch is always 0
			je drawEnemySpriteIncX
			drawEnemySpriteDrawPixel:
			push [si]
			push dx
			push cx
			call Pixel
			drawEnemySpriteIncX:
			inc cx
			add si, 2
			jmp drawEnemySpriteLoopY
		drawEnemySpriteIncY:
			inc dx
			jmp drawEnemySpriteLoop
	drawEnemySpriteEnd:
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		pop si
		ret 8
endp

proc drawCannon
	push si
	push bp
	mov bp, sp
	mov si, [bp + 6]
	push ax
	push bx
	push cx
	push dx

	mov cx, [cannonX] ;xpos
	mov dx, [cannonY] ;ypos
	mov ax, cx
	add ax, [cannonWidth]
	mov bx, dx
	add bx, [cannonHeight]
	drawCannonSpriteLoop:
		cmp dx, bx
		jge drawCannonSpriteEnd
		mov cx, ax
		sub cx, [cannonWidth]
		drawCannonSpriteLoopY:
			cmp cx, ax
			jge drawCannonSpriteIncY
			cmp [si], ch ;because ch is always 0
			je drawCannonSpriteIncX
			push [si]
			push dx
			push cx
			call Pixel
			drawCannonSpriteIncX:
			inc cx
			add si, 2
			jmp drawCannonSpriteLoopY
		drawCannonSpriteIncY:
			inc dx
			jmp drawCannonSpriteLoop
	drawCannonSpriteEnd:
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		pop si
		ret 2
endp

proc drawBomb ;requires diffrent functions
	push si
	push bp
	mov bp, sp
	mov si, offset enemyProjectileSprite
	push ax
	push bx
	push cx
	push dx

	mov cx, [bp + 6] ;xpos
	mov dx, [bp + 8] ;ypos
	mov ax, cx
	add ax, 3
	mov bx, dx
	add bx, 5
	drawBombSpriteLoop:
		cmp dx, bx
		jge drawBombSpriteEnd
		mov cx, ax
		sub cx, 3
		drawBombSpriteLoopY:
			cmp cx, ax
			jge drawBombSpriteIncY
			;push dx
			;push cx
			;call readPixel
			;cmp al, 00h
			;jne drawBombSpriteIncX
				cmp [si], ch ;because ch is always 0
				je drawBombSpriteIncX
					push [si]
					push dx
					push cx
					call Pixel
				drawBombSpriteIncX:
				inc cx
				add si, 2
				jmp drawBombSpriteLoopY
		drawBombSpriteIncY:
			inc dx
			jmp drawBombSpriteLoop
	drawBombSpriteEnd:
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		pop si
		ret 8
endp

proc clearBomb ;requires diffrent functions
	push si
	push bp
	mov bp, sp
	mov si, offset bombSprite
	push ax
	push bx
	push cx
	push dx

	mov cx, [bp + 6] ;xpos
	mov dx, [bp + 8] ;ypos
	mov ax, cx
	add ax, 3
	mov bx, dx
	add bx, 4
	clearBombSpriteLoop:
		cmp dx, bx
		jge clearBombSpriteEnd
		mov cx, ax
		sub cx, 4
		clearBombSpriteLoopY:
			cmp cx, ax
			jge clearBombSpriteIncY
			;push dx
			;push cx
			;call readPixel
			;cmp al, 00h
			;jne drawBombSpriteIncX
					push 00h
					push dx
					push cx
					call Pixel
				clearBombSpriteIncX:
				inc cx
				add si, 2
				jmp clearBombSpriteLoopY
		clearBombSpriteIncY:
			inc dx
			jmp clearBombSpriteLoop
	clearBombSpriteEnd:
		pop dx
		pop cx
		pop bx
		pop ax
		pop bp
		pop si
		ret 8
endp

proc printText
	push bp
	mov bp, sp
	
	mov dx, [bp + 4]
	mov ah, 09h
	int 21h
	
	mov ah, 00h
	int 16h
	
	pop bp
	ret
endp

proc clearCannon ;claears the canon so it will look like its moving
	push [black]
	push [cannonHeight]
	push [cannonWidth]
	push [cannonY]
	push [cannonX]
	call drawRect
	ret
endp

proc getKey ;getting a key from the user
	mov ah, 00h
	int 16h
	ret
endp

proc maxOutOfEnemyArray
	push ax
	push si
	
	xor dx, dx
	mov si, ax
	maxOutOfEnemyArrayLoop:
		mov ax, [si]
		cmp ax, 0
		je maxOutOfEnemyArrayEnd
		
		mov ax, [si + 4]
		cmp ax, 4
		jl maxOutOfEnemyArrayLoopEnd
		
		mov ax, [si]
		cmp dx, ax
		jg maxOutOfEnemyArrayLoopEnd
		mov dx, ax
		
		maxOutOfEnemyArrayLoopEnd:
			add si, 6
			jmp maxOutOfEnemyArrayLoop
	maxOutOfEnemyArrayEnd:
	pop si
	pop ax
	ret
endp

proc minOutOfEnemyArray
	push ax
	push si
	
	mov dx, 300
	mov si, ax
	minOutOfEnemyArrayLoop:
		mov ax, [si]
		cmp ax, 0
		je minOutOfEnemyArrayEnd
		
		mov ax, [si + 4]
		cmp ax, 4
		jl minOutOfEnemyArrayLoopEnd
		
		mov ax, [si]
		cmp dx, ax
		jl minOutOfEnemyArrayLoopEnd
		mov dx, ax
		
		minOutOfEnemyArrayLoopEnd:
			add si, 6
			jmp minOutOfEnemyArrayLoop
	minOutOfEnemyArrayEnd:
	pop si
	pop ax
	ret
endp

proc maxYOutOfEnemyArray
	push ax
	push si
	
	mov dx, 0
	mov si, ax
	maxYOutOfEnemyArrayLoop:
		mov ax, [si]
		cmp ax, 0
		je maxYOutOfEnemyArrayEnd
		
		mov ax, [si + 4]
		cmp ax, 4
		jl maxYOutOfEnemyArrayLoopEnd
		
		mov ax, [si + 2]
		cmp dx, ax
		jg maxYOutOfEnemyArrayLoopEnd
		mov dx, ax
		
		maxYOutOfEnemyArrayLoopEnd:
			add si, 6
			jmp maxYOutOfEnemyArrayLoop
	maxYOutOfEnemyArrayEnd:
	pop si
	pop ax
	ret
endp

proc countRemainingEnemies
	push ax
	push si
	
	mov [numOfEnemies], 0
	mov si, ax
	countRemainingEnemiesLoop:
		mov ax, [si]
		cmp ax, 0
		je countRemainingEnemiesEnd
		
		mov ax, [si + 4]
		cmp ax, 4
		jl countRemainingEnemiesLoopEnd
		inc [numOfEnemies]
		
		
		countRemainingEnemiesLoopEnd:
			add si, 6
			jmp countRemainingEnemiesLoop
	countRemainingEnemiesEnd:
	pop si
	pop ax
	ret
endp

proc randomNum
	push ax
	push cx
	push dx
	
	mov ah, 2Ch
	int 21h
	mov dh, 0
	cmp [randomNumber], dx
	je theRandomNumbersAreEqual
	mov [randomNumber], dx
	jmp endOfRandomNum
	theRandomNumbersAreEqual:
	add dl, 30   ;to fix the option of the clock not moving
	mov [randomNumber], dx
	
	endOfRandomNum:
	pop dx
	pop cx
	pop ax
	ret
endp

proc decreaseToZero
	push bp
	mov bp, sp
	push si
	push dx
	
	mov si, [bp + 4]
	mov dx, 0
	cmp [si], dx
	jle decreaseToZeroEnd
	mov dx, 4
	cmp [si], dx
	jge decreaseToZeroEnd
	mov dx, 1
	sub [si], dx
	
	decreaseToZeroEnd:
	pop dx
	pop si
	pop bp
	ret 2
endp

proc clearScreen
	call graphicMode
	ret
endp

proc clearBullet
	push [black]
	push [bulletHeight]
	push [bulletWidth]
	push [BulletY]
	push [bulletX]
	call drawRect
	ret
endp

proc bulletSlower
	cmp [bulletSpeed], 1
	je subByBulletY
	mov [bulletSpeed], 1
	jmp endOfBulletSlower
	subByBulletY:
	sub [bulletY], 1
	mov [bulletSpeed], 0
	endOfBulletSlower:
endp

proc shoot
	mov [smokeInTheAir], 1
	mov ax, [cannonX]
	add ax, [startingPoint]
	mov [bulletX], ax
	mov ax, [cannonY]
	mov [bulletY], ax
	call drawBullet
	ret
endp

proc waits
	push ax
	push cx
	push dx
	
	mov ah, 2Ch
	int 21h
	mov [oldTime], dl
	
	waitsLoop:
	mov ah, 2Ch
	int 21h
	cmp dl, [oldTime]
	je waitsLoop
	jmp waitsEnd
	
	waitsEnd:
	pop dx
	pop cx
	pop ax
	ret
endp 

proc drawBullet ;gets x and y and draws a bullet
	push bp
	mov bp, sp
	push ax
	
	push [white]
	push [bulletHeight]
	push [bulletWidth]
	push [bulletY]
	push [bulletX]
	call drawRect
	pop ax
	pop bp
	ret
endp

proc shootEnemyProjectile1
	push si
	mov si, ax
	
	
	call randomNum
	call chooseRandomEnemy
	mov ax, 0
	cmp [enemyProjectile1X], ax
	jne endOfShootEnemyProjectile1
	cmp [enemyProjectile1Y], ax
	jne endOfShootEnemyProjectile1
	add si, [randomEnemy]
	mov ax, 67
	cmp [si + 2], ax                         ;to avoid suiciders shooting
	je endOfShootEnemyProjectile1
	mov ax, 51
	cmp [si + 2], ax
	je endOfShootEnemyProjectile1
	mov ax, 4
	cmp [si + 4], ax
	jl endOfShootEnemyProjectile1
	mov ax, [si]
	add ax, 6 ; half of enemyWidth
	add ax, [enemyClusterX]
	mov [enemyProjectile1X], ax
	mov ax, [si + 2]
	add ax, 8 ;enemyHeight
	add ax, [enemyClusterY]
	mov [enemyProjectile1Y], ax
	mov [pickle1], 1
	
	endOfShootEnemyProjectile1:
	pop si
	ret
endp

proc chooseRandomEnemy ;chooses random enemy from the alive ones
	push  ax
	push dx
	
	call randomNum
	mov ax, [randomNumber]
	mov dl, 6
	mul dl
	inc ax
	
	reductionLoop:
	cmp ax, 390
	jle endOfChooseRandomEnemy
	sub ax, 390
	jmp reductionLoop
	
	endOfChooseRandomEnemy:
	xor dx, dx
	inc ax
	mov bx, 6
	div bx
	mov dx, 6
	mul dx
	mov [randomEnemy], ax
	
	pop dx
	pop ax
	ret
endp 

proc isKeyPressed ;checking if key is pressed(gets state of keyboard buffer)
	mov ah, 01h
	int 16h
	ret
endp

proc clearEnemies ;draws enemys from an array (they are bricks for now)
	push ax
	push si
	
	mov si, ax
	clearEnemiesLoop:
		mov ax, [si]
		cmp ax, 0
		je clearEnemiesEnd
		
		mov ax, [si + 4]
		cmp ax, 0
		je clearEnemiesNonpresent
		cmp ax, 4
		jl clearEnemiesKilled
		push [black]
		jmp clearEnemiesPresent
		
		clearEnemiesKilled:
		push [black]
		push [enemyHeight]
		push[enemyWidth]
		mov dx, [si + 2]
		add dx, bx
		push dx
		mov dx, [si]
		add dx, cx
		push dx
		call drawRect
		jmp clearEnemiesContinue
		
		clearEnemiesNonpresent:
		push [black]
		
		clearEnemiesPresent:
		push [enemyHeight]
		push [enemyWidth]
		mov dx, [si + 2]
		add dx, bx
		push dx
		mov dx, [si]
		add dx, cx
		push dx
		call drawRect
		
		clearEnemiesContinue:
		add si, 6
		jmp clearEnemiesLoop
	clearEnemiesEnd:
	pop si
	pop ax
	ret
endp

proc cannonExplosion
	push ax
	push bx
	
	mov ax, 0
	xor bx, bx
	
	call clearScreen
	call clearCannon
	destructionLoop:
	cmp ax, 30
	je destroyCannonEnd
		changeAnimationLoop:
		cmp bx, 32000
		je changeAnimation
		inc bx
		jmp changeAnimationLoop
		
		changeAnimation:
		call waits
		call clearCannon
		cmp [cannonAnimationPose], 1
		je changeAnimationTrue
		push offset cannonSpriteDestroyed2
		call drawCannon
		mov [cannonAnimationPose], 1
		xor bx, bx
		inc ax
		
		jmp destructionLoop
		
		changeAnimationTrue:
		call waits
		call clearCannon
		push offset cannonSpriteDestroyed1
		call drawCannon
		mov [cannonAnimationPose], 0
		xor bx, bx
		inc ax
		jmp destructionLoop
	destroyCannonEnd:
	call clearCannon
	mov [pickle1], 0
	pop bx
	pop ax
	ret
endp

proc drawEnemies ;draws enemys from an array (they are bricks for now)
	push ax
	push si
	
	mov si, ax
	drawEnemiesLoop:
		mov ax, [si]
		cmp ax, 0
		je drawEnemiesEnd
		
		mov ax, [si + 4]
		cmp ax, 0
		je drawEnemiesNonpresent
		cmp ax, 4
		jl drawEnemiesKilled
		push [blackOrWhite]
		jmp drawEnemiesPresent
		
		drawEnemiesKilled:
		;push [black]
		;push [enemyHeight]
		;push[enemyWidth]
		;mov dx, [si + 2]
		;add dx, bx
		;push dx
		;mov dx, [si]
		;add dx, cx
		;push dx
		;call drawRect
		jmp drawEnemiesContinue
		
		drawEnemiesNonpresent:
		jmp drawEnemiesContinue
		
		drawEnemiesPresent:
		mov dx, [si + 2]
		add dx, bx
		push dx
		call findSuitableAnimation
		mov dx, [si]
		add dx, cx
		push dx
		push ax
		call drawEnemySprite
		
		drawEnemiesContinue:
		add si, 6
		jmp drawEnemiesLoop
	drawEnemiesEnd:
	pop si
	pop ax
	ret
endp

proc bombCollision
	push bp
	mov bp, si
	push ax
	push bx
	push cx
	
	cmp [pickle1], 1
	jne checkPickle2Collision
	mov ax, [enemyProjectile1Y]
	cmp [cannonY], ax
	jne checkPickle2Collision
		inc ax ;ypos
		mov bx, [enemyProjectile1X] ; xpos
		mov cx, bx
		add cx, 3 ;max xpos
		targetSpottingPickle1:
			cmp bx, cx
			jg checkPickle2Collision
			mov ax, bx
			sub ax, [cannonX]
			cmp ax, [cannonWidth]
			jg notLocking
			cmp ax, 0
			jl notLocking
			call clearScreen
			call cannonExplosion
			mov [pickle1], 0
			mov [enemyProjectile1X], 0
			mov [enemyProjectile1Y], 0
			mov [FireEveryN], 0
			dec [lives]
			call drawBasicBackground
			inc bx
			jmp bombCollisionEnd
			notLocking:
			inc bx
			
			jmp targetSpottingPickle1
		checkPickle2Collision:
		
		
		bombCollisionEnd:
	pop cx
	pop bx
	pop ax
	pop bp
endp

proc collisionField
	push bp
	mov bp, sp
	push bx
	push cx
	push dx
	
		mov cx, [bp + 4] ;bottom collision
		mov dx, [bp + 6]
		add dx, [enemyHeight]
		add dx, [enemyClusterY]
		add cx, [enemyClusterX]
		inc dx
		cmp dx, [bulletY]
		jne leftCollision
		sub cx, 2
		mov dx, [bulletX]
		sub dx, cx
		cmp dx, [enemyWidthPlus]
		ja leftCollision
		jmp collisionFieldHit
	leftCollision:
		mov cx, [bp + 4]
		mov dx, [bp + 6]
		add dx, [enemyClusterY]
		add cx, [enemyClusterX]
		dec cx
		cmp cx, [bulletX]
		jne rightCollision
		dec dx
		mov cx, [bulletY]
		sub cx, dx
		cmp cx, [enemyHeightPlus]
		ja rightCollision
		jmp collisionFieldHit
	rightCollision:
		mov cx, [bp + 4]
		mov dx, [bp + 6]
		add dx, [enemyClusterY]
		add cx, [enemyClusterX]
		add cx, [enemyWidth]
		inc cx
		cmp cx, [bulletX]
		jne collisionFieldEnd
		dec dx
		mov cx, [bulletY]
		sub cx, dx
		cmp cx, [enemyHeightPlus]
		ja collisionFieldEnd
		jmp collisionFieldHit
		
	collisionFieldHit:
		mov ax, 1
	
	collisionFieldEnd:
	pop dx
	pop cx
	pop bx
	pop bp
	ret 4
endp
	
proc collisionEnemies
	push ax
	push si
	
	mov si, ax
	collideEnemiesLoop:
		mov ax, [si]
		cmp ax, 0
		je collideEnemiesEnd
		
		mov ax, [si + 4]
		cmp ax, 4
		jl collideEnemiesContinue
		jmp collideEnemiesPresent
			
		collideEnemiesPresent:
			push [si + 2]
			push [si]
			call collisionField
			cmp ax, 1
			je collideEnemyDestroy
			jmp collideEnemiesContinue
		
		collideEnemyDestroy:
			mov ax, 3
			mov [si + 4], ax
			
			push 50 ;drawEnemySprite bugs out, fix by pushing a random insignificant number
			mov ax, [si + 2]
			add ax, [enemyClusterY]
			push ax
			mov ax, [si]
			add ax, [enemyClusterX]
			push ax
			push offset enemyExplosion
			call drawEnemySprite	
			push [noteC2]
			call beep
			call waitTenth
			call stopBeep
			mov [smokeInTheAir], 0 ;eliminates the bullet
			call clearBullet
			mov [bulletX], 0
			mov [bulletY], 0
			
			jmp collideEnemiesEnd
		
		collideEnemiesContinue:
			mov ax, si
			add ax, 4
			push ax
			call decreaseToZero
			add si, 6
			jmp collideEnemiesLoop
		
	collideEnemiesEnd:
		pop si
		pop ax
		ret 4
endp

proc findSuitableSound
	cmp [noteStep], 0
	je playNote1
	cmp [noteStep], 1
	je playNote2
	cmp [noteStep], 2
	je playNote3
	cmp [noteStep], 3
	je playNote4
	
	playNote1:
	push [note1]
	call beep
	inc [noteStep]
	jmp findSuitableSoundEnd
	
	playNote2:
	push [note2]
	call beep
	inc [noteStep]
	jmp findSuitableSoundEnd
	
	playNote3:
	push [note3]
	call beep
	inc [noteStep]
	jmp findSuitableSoundEnd
	
	playNote4:
	push [note4]
	call beep
	mov [noteStep], 0
	jmp findSuitableSoundEnd
	
	findSuitableSoundEnd:
	ret
endp

proc findSuitableAnimation
	push bp
	mov bp ,sp
	
	mov ax, [bp + 4]
	sub ax, [enemyClusterY]
	cmp ax, 3
	je bomberAnimation
	cmp ax, 19
	je fighterAnimation
	cmp ax, 35
	je fighterAnimation
	cmp ax, 51
	je suicidalAnimation
	cmp ax, 67
	je suicidalAnimation
	mov ax, offset fighterPose1
	jmp findSuitableAnimationEnd
	
	bomberAnimation:
	cmp [enemyAnimationPose], 0
	jne pushSmallInvaderPose2
		mov ax, offset smallInvaderPose1
		jmp findSuitableAnimationEnd
		
	pushSmallInvaderPose2:
		mov ax, offset smallInvaderPose2
		jmp findSuitableAnimationEnd
	jmp findSuitableAnimationEnd
	
	fighterAnimation:
	cmp [enemyAnimationPose], 0
	jne pushFighterPose2
		mov ax, offset fighterPose1
		jmp findSuitableAnimationEnd
		
	pushFighterPose2:
		mov ax, offset fighterPose2
		jmp findSuitableAnimationEnd
	
	suicidalAnimation:
	cmp [enemyAnimationPose], 0
	jne pushLargeInvaderPose2
		mov ax, offset largeInvaderPose1
		jmp findSuitableAnimationEnd
		
	pushLargeInvaderPose2:
		mov ax, offset largeInvaderPose2
		jmp findSuitableAnimationEnd
	jmp findSuitableAnimationEnd
	
	findSuitableAnimationEnd:
	pop bp 
	ret
endp

proc resetEnemiesArray
	push si
	push ax
	mov si, offset enemiesArray
	
	resetEnemiesArrayLoop:
	mov ax, 0
	cmp [si], ax
	je resetEnemiesArrayEnd
	mov ax, 4
	mov [si + 4], ax
	add si, 6
	jmp resetEnemiesArrayLoop
	
	resetEnemiesArrayEnd:
	pop ax
	pop si
	ret
endp 

proc resetRound
	call clearScreen
	mov [pickle1], 0
	mov [smokeInTheAir], 0
	mov [enemyClusterX], 20
	mov [enemyClusterY], 20
	mov [cannonX], 144
	call resetEnemiesArray
	ret
endp 






start:
	mov ax, @data
	mov ds, ax
	
	call graphicMode
	push offset starting_screen_text
	call printText
	call graphicMode
	
	
	call drawBasicBackground
	mainLoop:
		call isKeyPressed
		jz calculatorLoopConnector
		call clearCannon
		
		
		;Keys Section
		;-------------------------------------------
		call getKey
		cmp al, "a"
		je KeyA
		cmp al, "d"
		je KeyD
		cmp al, "l"
		je KeyL
		cmp al, "p"
		je KeyP
		calculatorLoopConnector:
		jmp calculatorLoop
		
		KeyA:
			cmp [cannonX], 1
			jl calculatorLoop
			mov ax, [cannonSpeed]
			sub [cannonX], ax
			jmp calculatorLoop
		KeyD:
			cmp [cannonX], 305
			jg calculatorLoop
			mov ax, [cannonSpeed]
			add [cannonX], ax
			jmp calculatorLoop
		KeyL:
		cmp [smokeInTheAir], 1
		je calculatorLoop
			call shoot
			push [shootNote]
			call beep
			jmp calculatorLoop
		KeyP:
			
			;call resetRound
			jmp exit
		;-------------------------------------------
		
		
		
		calculatorLoop:
			bulletUpdate:
			cmp [smokeInTheAir], 1
			jne enemyBoundries
				cmp [bulletY], 21
				jg enemyBoundries
				mov [smokeInTheAir], 0
				push [bulletY]
				push [bulletX]
				call clearBullet
			
			enemyBoundries:
			mov ax, [enemyClusterMovementSpeed]
			cmp [enemyClusterMovementCounter], ax ;counter for not moving the enemy every 1/1000 of a second
			jle endOfEnemyBoundriesConnector 
				mov bx, [enemyClusterY]
				mov cx, [enemyClusterX]
				mov ax, offset enemiesArray
				mov [blackOrWhite], 00h
				call clearEnemies
				cmp [enemyMoveDirection], 0
				je leftSideboundry
					mov ax, offset enemiesArray ;right side boundry
					call maxOutOfEnemyArray
					add dx, [enemyClusterX]
					cmp dx, 300 
					jg changeEnemyDirectionToLeft
					mov ax, [enemyClusterX]
					add ax, [enemyClusterXDelta]
					mov [enemyClusterX], ax
					mov [enemyClusterMovementCounter], 1
					cmp [enemyAnimationPose], 0
					je incEnemyAnimationPoseRight
					dec [enemyAnimationPose]
					jmp endOfEnemyBoundries
					incEnemyAnimationPoseRight:
					inc [enemyAnimationPose]
					
					jmp endOfEnemyBoundries
				
				endOfEnemyBoundriesConnector:
				jmp endOfEnemyBoundries
				
				leftSideboundry:
					mov ax, offset enemiesArray
					call minOutOfEnemyArray
					add dx, [enemyClusterX]
					cmp dx, 10
					jl changeEnemyDirectionToRight
					mov ax, [enemyClusterX]
					sub ax, [enemyClusterXDelta]
					mov [enemyClusterX], ax
					mov [enemyClusterMovementCounter], 0
					cmp [enemyAnimationPose], 0
					je incEnemyAnimationPoseLeft
					dec [enemyAnimationPose]
					jmp endOfEnemyBoundries
					incEnemyAnimationPoseLeft:
					inc [enemyAnimationPose]
					jmp endOfEnemyBoundries
					
				
					
				changeEnemyDirectionToLeft:
					mov ax, [enemyClusterY]
					add ax, [enemyClusterYDelta]
					mov [enemyClusterY], ax
					mov [enemyMoveDirection], 0
					mov [enemyClusterMovementCounter], 0
					jmp endOfEnemyBoundries
					
				changeEnemyDirectionToRight:
					mov ax, [enemyClusterY]
					add ax, [enemyClusterYDelta]
					mov [enemyClusterY], ax
					mov [enemyMoveDirection], 1
					mov [enemyClusterMovementCounter], 0
					jmp endOfEnemyBoundries
					
			endOfEnemyBoundries:
			add [enemyClusterMovementCounter], 1
			
			
			sounds:
			;mov ah, 2Ch
			;int 21h
			;cmp dh, [oldTime]
			;je soundsContinue
			;mov [oldTime], dh
			;call stopBeep
			
			soundsContinue:
			
			pickle1Check:
			cmp [pickle1], 1
			jne pickle2Check
				cmp [enemyProjectile1Y], 195
					jle pickle2Check
					mov [pickle1], 0
					push [enemyProjectile1Y]
					push [enemyProjectile1X]
					call clearBomb
					mov [enemyProjectile1X], 0
					mov [enemyProjectile1Y], 0
					
			pickle2Check:
			mov ax, [FireEveryN]
			cmp ax, 500
			jle enemyHoldFire
			mov ax, offset enemiesArray
			call shootEnemyProjectile1
			mov [FireEveryN], 0
			
			enemyHoldFire:
			inc [FireEveryN]
			
		drawLoop:
			mov [drawBackground], 1
			mov ax, offset enemiesArray
			call collisionEnemies
			mov [drawBackground], 0
			mov bx, [enemyClusterY]
			mov cx, [enemyClusterX]
			mov ax, offset enemiesArray
			mov [blackOrWhite], 0Fh
			call drawEnemies
			
			push offset cannonSprite
			call drawCannon
			
			cmp [smokeInTheAir], 1
			jne skipBulletUpdate
				cmp [bulletSpeed], 5
				je setBulletSpeed0
					inc [bulletSpeed]
					jmp skipBulletUpdate
				setBulletSpeed0:
					call clearBullet
					sub [bulletY], 1
					call drawBullet
					mov [bulletSpeed], 0
			skipBulletUpdate:
			
			cmp [pickle1], 1
			jne skipPickle1Update
			cmp [enemyProjectile1Speed], 10
				je setEnemyProjectile1Speed0
					inc [enemyProjectile1Speed]
					jmp skipPickle1Update
					setEnemyProjectile1Speed0:
					push [enemyProjectile1Y]
					push [enemyProjectile1X]
					call clearBomb
					inc [enemyProjectile1Y]
					push [enemyProjectile1Y]
					push [enemyProjectile1X]
					call drawBomb
					mov [enemyProjectile1Speed], 0
			skipPickle1Update:
			
			cmp [lives], 0
			jne checkRaminingEnemies
			call clearScreen
			push offset LoserText
			call printText
			jmp exit
			
			checkRaminingEnemies:
			call countRemainingEnemies
			cmp [numOfEnemies], 0
			jne checkWinning
			call clearScreen
			push offset WinnerText
			call printText
			jmp exit
			
			checkWinning:
			mov ax, offset enemiesArray
			call maxYOutOfEnemyArray
			add dx, [enemyClusterY]
			cmp dx, 185
			jl skipEnemyProjectile1Update
			call clearScreen
			push offset LoserText
			call printText
			jmp exit
			
			skipEnemyProjectile1Update:
			call bombCollision
	jmp mainLoop
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


