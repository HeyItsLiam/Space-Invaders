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
	smokeInTheAir dw 0 ; 1 or 0 depends on if theres a cannon bullet is allready fired
	startingPoint dw 15 ;half of cannonWidth
	bulletHeight dw 8
	bulletWidth dw 1
	bulletX dw 0
	bulletY dw 0
	bulletSpeed dw 1
	;------------------------------------------------
	
	;Enemies Related
	;------------------------------------------------
	enemyClusterMovementCounter dw 0
	enemyClusterMovementSpeed dw 200 ;the higher the slower
	enemyClusterX dw 70
	enemyClusterY dw 20
	enemyClusterXDelta dw 5
	enemyClusterYDelta dw 15
	enemyHeight dw 8
	enemyWidth dw 12
	enemyHeightPlus dw 10
	enemyWidthPlus dw 14
	enemyMoveDirection dw 1 ;1 = right 0 = left
	enemiesArray dw 1,3,4,19,3,4,37,3,4,55,3,4,73,3,4,91,3,4,109,3,4,127,3,4,145,3,4,163,3,4,181,3,4,199,3,4,217,3,4,1,19,4,19,19,4,37,19,4,55,19,4,73,19,4,91,19,4,109,19,4,127,19,4,145,19,4,163,19,4,181,19,4,199,19,4,217,19,4,1,35,4,19,35,4,37,35,4,55,35,4,73,35,4,91,35,4,109,35,4,127,35,4,145,35,4,163,35,4,181,35,4,199,35,4,217,35,4,1,51,4,19,51,4,37,51,4,55,51,4,73,51,4,91,51,4,109,51,4,127,51,4,145,51,4,163,51,4,181,51,4,199,51,4,217,51,4,1,67,4,19,67,4,37,67,4,55,67,4,73,67,4,91,67,4,109,67,4,127,67,4,145,67,4,163,67,4,181,67,4,199,67,4,217,67,4,0

	;------------------------------------------------
	
	;Colors
	;-------------------------------------------------
	black dw 00h
	white dw 0Fh
	blackOrWhite dw 00h
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
		add si, 6
		jmp drawEnemiesLoop
	drawEnemiesEnd:
	pop si
	pop ax
	ret
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
			;call testRect
			;play sound
			;play animation
			
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
			call shoot
			jmp calculatorLoop
		KeyP:
			jmp exit
		;-------------------------------------------
		
		
		
		calculatorLoop:
			cmp [smokeInTheAir], 1
			jne enemyBoundries
				cmp [bulletY], 0
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
				call drawEnemies
				cmp [enemyMoveDirection], 0
				je leftSideboundry
					cmp [enemyClusterX], 75 ;right side boundry
					ja changeEnemyDirectionToLeft
					mov ax, [enemyClusterX]
					add ax, [enemyClusterXDelta]
					mov [enemyClusterX], ax
					mov [enemyClusterMovementCounter], 1
					jmp endOfEnemyBoundries
					
				leftSideboundry:
					cmp [enemyClusterX], 30
					jb changeEnemyDirectionToRight
					mov ax, [enemyClusterX]
					sub ax, [enemyClusterXDelta]
					mov [enemyClusterX], ax
					mov [enemyClusterMovementCounter], 0
					jmp endOfEnemyBoundries
					
				endOfEnemyBoundriesConnector:
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
			
		drawLoop:
			mov ax, offset enemiesArray
			call collisionEnemies
			mov bx, [enemyClusterY]
			mov cx, [enemyClusterX]
			mov ax, offset enemiesArray
			mov [blackOrWhite], 0Fh
			call drawEnemies

			call drawCannon
			
			cmp [smokeInTheAir], 1
			jne skipBulletUpdate
				cmp [bulletSpeed], 1
				je setBulletSpeed0
					call clearBullet
					sub [bulletY], 1
					call drawBullet
					mov [bulletSpeed], 1
					jmp skipBulletUpdate
				setBulletSpeed0:
					mov [bulletSpeed], 0
			skipBulletUpdate:
			
			
			
		
		
	
	jmp mainLoop
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


