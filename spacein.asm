IDEAL
MODEL small
STACK 100h
DATASEG
	testText db "Testing",10,".",10,".",10,"$"
	;Cannon
	;------------------------------------------------
	cannonX dw 9
	cannonY dw 180
	cannonSpeed dw 2
	cannonHeight dw 6
	cannonWidth dw 31
	;------------------------------------------------
	;Bullet
	;------------------------------------------------
	smokeInTheAir dw 0 ; 1 or 0 depends on if theres a cannon bullet already
	startingPoint dw 15 ;half of cannonWidth
	bulletHeight dw 8
	bulletWidth dw 1
	bulletX dw 0
	bulletY dw 0
	bulletSpeed dw 1
	;------------------------------------------------
	
	;Enemies Related
	;------------------------------------------------
	enemyClusterXDelta dw 70
	enemyClusterYDelta dw 50
	enemyHeight dw 10
	enemyWidth dw 15
	enemiesArray dw 1,4,28h,4,21,4,28h,4,41,4,28h,4,61,4,28h,4,81,4,28h,4,101,4,28h,4,121,4,28h,4,141,4,28h,4,161,4,28h,4,181,4,28h,4,201,4,28h,4,1,22,28h,4,21,22,28h,4,41,22,28h,4,61,22,28h,4,81,22,28h,4,101,22,28h,4,121,22,28h,4,141,22,28h,4,161,22,28h,4,181,22,28h,4,201,22,28h,4,1,40,28h,4,21,40,28h,4,41,40,28h,4,61,40,28h,4,81,40,28h,4,101,40,28h,4,121,40,28h,4,141,40,28h,4,161,40,28h,4,181,40,28h,4,201,40,28h,4,1,58,28h,4,21,58,28h,4,41,58,28h,4,61,58,28h,4,81,58,28h,4,101,58,28h,4,121,58,28h,4,141,58,28h,4,161,58,28h,4,181,58,28h,4,201,58,28h,4,1,76,28h,4,21,76,28h,4,41,76,28h,4,61,76,28h,4,81,76,28h,4,101,76,28h,4,121,76,28h,4,141,76,28h,4,161,76,28h,4,181,76,28h,4,201,76,28h,4
	;------------------------------------------------
	
	;Colors
	;-------------------------------------------------
	black dw 00h
	white dw 0Fh
	;-------------------------------------------------
	
	
	
CODESEG

proc graphicMode ;Literally graphic mode
	push ax
	mov ax, 13h
	int 10h
	
	pop ax
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

proc waits ;waits for maximum 81 seconds
	pop dx
	
	mov ah, 86
	xor cx, cx
	int 15h
	
endp
	
proc clearBullet
	push bp
	mov bp, sp
	push ax
	
	push [black]
	push [bulletHeight]
	push [bulletWidth]
	push [BulletY]
	push [bulletX]
	call drawRect
	pop ax
	pop bp
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


proc drawBullet ;gets x and y and draws a bullet
	push bp
	mov bp, sp
	push ax
	
	push [white]
	push [bulletHeight]
	push [bulletWidth]
	mov ax, [bp + 6]
	mov [BulletY], ax
	push ax
	mov ax, [bp + 4]
	add ax, [startingPoint]
	push ax
	mov [bulletX], ax
	call drawRect
	pop ax
	pop bp
	ret
endp


proc isKeyPressed ;checking if key is pressed(gets state of keyboard buffer)
	mov ah, 01h
	int 16h
	ret
endp

proc drawCannon
	push [white]
	push [cannonHeight]
	push [cannonWidth]
	push [cannonY]
	push [cannonX]
	call drawRect
	ret
endp

proc drawEnemies ;draws enemys from an array (they are bricks for now)
	push ax
	push si
	
	mov si, ax
	drawEnemiesLoop:
		mov ax, [si]
		cmp ax, 00h
		je drawEnemiesEnd
		
		mov ax, [si + 6]
		cmp ax, 0
		je drawEnemiesNonpresent
		cmp ax, 4
		jl drawEnemiesKilled
		push [si + 4]
		jmp drawEnemiesPresent
		
		drawEnemiesKilled:
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
		jmp drawEnemiesContinue
		
		drawEnemiesNonpresent:
		push [black]
		
		drawEnemiesPresent:
		push [enemyHeight]
		push [enemyWidth]
		mov dx, [si + 2]
		add dx, bx
		push dx
		mov dx, [si]
		add dx, cx
		push dx
		call drawRect
		
		drawEnemiesContinue:
		add si, 8
		jmp drawEnemiesLoop
	drawEnemiesEnd:
	pop si
	pop ax
	ret
endp


start:
	mov ax, @data
	mov ds, ax
	
	call graphicMode
	
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
			cmp [cannonX], 260
			jg calculatorLoop
			mov ax, [cannonSpeed]
			add [cannonX], ax
			jmp calculatorLoop
		KeyL:
		cmp [smokeInTheAir], 1
		je calculatorLoop
			mov [smokeInTheAir], 1
			push [cannonY]
			push [cannonX]
			call drawBullet
			jmp calculatorLoop
		KeyP:
			jmp exit
		;-------------------------------------------
		
		
		
		calculatorLoop:
			cmp [smokeInTheAir], 1
			jne sidesBoundries
			cmp [bulletY], 0
			jg sidesBoundries
			mov [smokeInTheAir], 0
			push [bulletY]
			push [cannonX]
			call clearBullet
			
			sidesBoundries:
			
			
		
		drawLoop:
			mov bx, [enemyClusterYDelta]
			mov cx, [enemyClusterXDelta]
			mov ax, offset enemiesArray
			call drawEnemies
			push 10h
			call waits
			call drawCannon
			
			cmp [smokeInTheAir], 1
			jne skipBulletUpdate
				push [bulletY]
				push [cannonX]
				call clearBullet
				;call bulletSlower check whats wrong with it in middle meeting
				cmp [bulletSpeed], 1
				je subByBulletY1
				mov [bulletSpeed], 1
				jmp endOfBulletSlower1
				subByBulletY1:
				sub [bulletY], 1
				mov [bulletSpeed], 0
				endOfBulletSlower1:
				push [bulletY]
				push [cannonX]
				call drawBullet
			skipBulletUpdate:
			
			
			
		
		
	
	jmp mainLoop
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


