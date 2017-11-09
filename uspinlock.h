

struct uspinlock {
uint locked;
};

void uacquire(struct uspinlock *lock);
void urelease(struct uspinlock *lock);

