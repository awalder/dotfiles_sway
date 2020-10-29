python
import sys
sys.path.insert(0, '/home/awalder/dev/git/gcc/libstdc++-v3/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

set auto-load safe-path /

set history save on
set print pretty on
set pagination off
set confirm off
