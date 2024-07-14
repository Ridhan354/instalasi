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
BZh91AY&SY Փ�  ����}����ޮ����  D   � P PL�omv�:�����������f���2z���@`�j  F���mSC@�       $D�(����	�# �4  h2C@ �M42 �� � b�M @I	��z��F&�i�4�����4 рx0�3����s�=�G���R�D�����&Gr�YU��&� ײ4b����,`����]U�o��0d
P��޾� hًL��{����d!����ӄ�P��c�ŢD%�6,����Ċ���(8�WK�ք���'`�s����DUx��8"�':�1𿑬���b���ǮX@���͓�'z/y��q%�!�m�e
Km���5�j�d��o-C�����k%Z�,]QM�4@b�"2	 ��q��E�+��HMt�1E�.�A���-& h���H�y~�ݾ�8�5�m2�eTk��I����Y,��H�v�˫,���,��{Y�!wR�a�a�d��d��Z��YT�wG$������o��΂��|r����4�7[$�n�B>��V!�Ѥ0�S��M�����x7$1�E�3#
'��2�m+Nv
-ԅEN�G)��?h��Z��P��Eb�� Jj�ycH^�&d�Z)�����ެ[	�sޑ����]���SZ0�*�)�w��}��6��_o�F'��b!`�	.]Q4�(XfBx���3��|E4B�a�3�K��=�u��sU��B�ړJ;M�ہ�vb@��y<+5ѲQU�	���F���F�ͤ"9��a�0�L��z�д�����6�4-�B5q#6ѭ��c�,�a$\�����,>�'Y��9�D��q�hha�)�!����o**��e��(RDL	#���<�"JFB��b�뷣��A��:�ʑ�-:�=�l�滸����m�5���J�Ԩ�I��vl%U�uC�Ѯ!��X�Y^�(`�{��_|a�8-�.Nu֘*2JU%$�ib��-3k��OV��>�˥H�"�3
�M�0�2�3�m1ZE�FZX�x��$���[���뤒T!�T���8)��ΈQlh⨜�`T"u���N�['�
��k�<U��JB���iT��eV��BH?�X���u���w�����Q8A!�rE8P� Փ�