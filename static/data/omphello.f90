program omp_hello
use omp_lib
implicit none

   integer :: i
   integer :: nthreads, tid

!$omp parallel private(nthreads,tid)
   nthreads=omp_get_num_threads()
   tid=omp_get_thread_num()
   print *, "Hello from thread ",tid,"of ",nthreads
!$omp end parallel

end program
