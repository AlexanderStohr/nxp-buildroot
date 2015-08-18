TTY=ttyLF0::wait:/bin/sh
grep -Fxq "$TTY" output/target/etc/inittab
OUTPUT=$?

if [[ $OUTPUT -eq 1 ]]
then
	sed -i '/^tty/d' output/target/etc/inittab
	sed -i -r '/#tty/c\ttyLF0::wait:/bin/sh' output/target/etc/inittab
fi

