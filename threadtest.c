#include "types.h"
#include "stat.h"
#include "user.h"

volatile int counter = 0;
struct lock lk;

void worker(void *arg1, void *arg2)
{
  int n = *(int*)arg1;
  int i;
  (void)arg2;

  for(i = 0; i < n; i++){
    lock_acquire(&lk);
    counter++;
    lock_release(&lk);
  }
  exit();
}

int
main(int argc, char *argv[])
{
  int n = 1000;
  int pid1, pid2;

  printf(1, "threadtest: starting\n");

  lock_init(&lk);

  pid1 = thread_create(worker, &n, 0);
  pid2 = thread_create(worker, &n, 0);

  if(pid1 < 0 || pid2 < 0){
    printf(1, "threadtest: thread_create failed\n");
    exit();
  }

  thread_join();
  thread_join();

  printf(1, "threadtest: counter = %d (expected %d)\n", counter, 2 * n);
  if(counter == 2 * n)
    printf(1, "threadtest: PASSED\n");
  else
    printf(1, "threadtest: FAILED\n");

  exit();
}
