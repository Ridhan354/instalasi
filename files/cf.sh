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
BZh91AY&SY�➯  �_�}������~����  D  � P P�h;��P		H�~TxP=L@��ѵ4 �� "M5�=@�h  h     	I1M�I�'���44  �   � Ѡ�bh2CF&#@ IL&��a4bjOQ�f&�$m�M�zj�Qq���"�:c�t��[r'�p3%��x�QC(Z�KG��y�~�{} 賀��@��{�7���w�#`��Q[a��] �sH�:v���R�Jo(�_ǉ�6�'����E?u����(���d<�a9�1q(nI	R\�i�K��c�,Hf�Rt9�ޟ`�����W��-4*���.	��@x��[��91 h�v��*_R�P����j�������C�?,B\p���^u��N�A	��Z�'�QqL�zY2�1H2��m�V��C�z5�Zƌ��m����HM�܇;J��8C�����
�+;��#�����;N�{���d�![��?�F�h����`G؅E4�D0�*�`����]�Pd�����ez��}�������"'�ss�����w�L$��[�\�N�#�,�5�|ߒB3�O.�A���sH�m�Y�RU\-6�ij0�(�B�� j�*�.�tM8��_�Oٰ�\���2��]I�"8��9r�z�BV�3{�rRx _сh-
�"�$�'���t���e�?Wy�ְ� y�����#P>&���o#b8��%�6�)�r�Su�JHj��(��<�`+
t_�%�q��N���0yl���0Ă��V'4A�2���9��ȟ(��N�]�J00�����xe��3"F͋��W������qcD8f�B�#Z��N}����@���NA0�x$+Eڠ�ND�|Q��������hv0��6�ϓ�P����ܔ4�bX8�R�8�8/"���BZƹ"7�̒Yt� kD}�T�&-�pKaA F]T�����3�A[�H��9۶��/����=�k>B@���H�
�S��