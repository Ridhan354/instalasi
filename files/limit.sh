#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYЄ�  T��}�sF�� ?���  D  � P @s����&!�dѧ�h4�h���� �S�"�{I� �@ h@4 � 	� 	��0� � $�&�#hA�OI�h�A��Ԗy��ޜo����d�F,���Pu�SJ�`R y��3*��h�N�a��ZR�	�I�kUUX][�֞�K�S�q�Ѭ���ݚ�#��������J��an�OWM_��ɟ��4cUUU�}��q��],=�:}�cv��<4xr���fm8VOf����
������P,�Z ��Y�t}�!*�4@'� Md��tI�Ǣ4�,a�ф��qC3�E���f'`S��E��UUu+E�g�v���Q��㶪Ls��9gg�dN\�Ȓ��&Y�ʃ�K���6E�N�}�"��NJ���p�g)!���4�cOH�4sT�W,z�]~<�w	7�D�-W���>[96����E��%�umU*�meQJ\ia��5]f6�G�L�M����آ�q%ד��0��b�U��VJ��/��x�C�"c����U�/1ٴU�~�0�x�����O��"}�&�*r}���]��B@[B$