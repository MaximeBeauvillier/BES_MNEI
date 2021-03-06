subroutine parametre(tf,Re,schema,nx,ny,nz,epsi,dt_storage)
	implicit none
	
	integer, intent(out) :: schema
	real*8, intent(out) :: tf,Re, epsi,dt_storage
	integer, intent(out) :: nx,ny,nz
	
	open(10,file = 'param.txt')
	read(10,*) nx
	read(10,*) ny
	read(10,*) nz
	read(10,*) schema
	read(10,*) Re
	read(10,*) tf
	read(10,*) dt_storage
	read(10,*) epsi	
	close(10)	

end subroutine parametre
	
	



subroutine initialisation(u,v,nx,ny)
	implicit none
	
	integer, intent(in) :: nx,ny 
	real*8, dimension(0:nx+1,0:ny+1), intent(out) :: u,v
	integer::i,j

	do j=0,ny+1
		do i=0,nx+1
			v(i,j) = 0.
			u(i,j) = 0.
		enddo
	enddo
	u(:,ny+1) = 2.

end subroutine initialisation


subroutine condition_limite(u,v,nx,ny)
	implicit none
	integer, intent(in) :: nx,ny 
	real*8, dimension(0:nx+1,0:ny+1), intent(inout) :: u,v	
	

	!Condition pour u
	!***********************************************************
	u(0,:) = 0.
	u(nx,:) = 0.
	u(:,0) = -u(:,1)
	u(:,ny+1) = 2.-u(:,ny)


	!Condition pour v
	!***********************************************************
	v(:,0) = 0.	
	v(:,ny) = 0.
	v(0,:) = -v(1,:)
	v(nx+1,:) = -v(nx,:)



end subroutine condition_limite
