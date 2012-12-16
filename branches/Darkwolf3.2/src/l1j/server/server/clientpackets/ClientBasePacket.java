/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package l1j.server.server.clientpackets;

import java.nio.ByteBuffer;
import java.util.logging.Level;
import java.util.logging.Logger;

import l1j.server.server.ClientThread;

/**
 * ClientBasePacket
 */
public abstract class ClientBasePacket {
    private static Logger _log = Logger.getLogger(ClientBasePacket.class.getName());

    private byte[] _decrypt;

    private int _off;

    /**
     * @param abyte0
     */
    protected void read(byte[] abyte0) {
        try {
            _log.finest("type=" + getType() + ", len=" + abyte0.length);
            _decrypt = abyte0;
            _off = 1;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        }
    }


    /**
     * @param decrypt
     * @param client
     * @throws Exception
     */
    public abstract void execute(byte[] decrypt, ClientThread client)
            throws Exception;

    public String getType() {
        return "[C] " + this.getClass().getSimpleName();
    }

    /**
     * @return byte[]
     */
    protected byte[] readByte() {
        byte[] result = new byte[_decrypt.length - _off];
        try {
            System.arraycopy(_decrypt, _off, result, 0, _decrypt.length - _off);
            _off = _decrypt.length;
        } catch (Exception e) {
            _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return result;
    }

    /**
     * @return byte
     */
    protected int readC() {
        try {
            if (_decrypt == null) {
                return 0x00;
            }
            if (_decrypt.length < _off + 1) {
                return 0x00;
            }
            int i = _decrypt[_off++] & 0xff;
            return i;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            // _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return 0x00;
    }

    /**
     * @return short
     */
    protected int readCH() {
        try {
            if (_decrypt == null) {
                return 0x00;
            }
            if (_decrypt.length < _off + 3) {
                return 0x00;
            }
            int i = _decrypt[_off++] & 0xff;
            i |= _decrypt[_off++] << 8 & 0xff00;
            i |= _decrypt[_off++] << 16 & 0xff0000;
            return i;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            // _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return 0x00;
    }

    /**
     * @return int
     */
    protected int readD() {
        try {
            if (_decrypt == null) {
                return 0x00;
            }
            if (_decrypt.length < _off + 4) {
                return 0x00;
            }
            int i = _decrypt[_off++] & 0xff;
            i |= _decrypt[_off++] << 8 & 0xff00;
            i |= _decrypt[_off++] << 16 & 0xff0000;
            i |= _decrypt[_off++] << 24 & 0xff000000;
            return i;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            // _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return 0x00;
    }

    /**
     * @return double
     */
    protected double readF() {
        try {
            if (_decrypt == null) {
                return 0x00;
            }
            if (_decrypt.length < _off + 8) {
                return 0D;
            }
            long l = _decrypt[_off++] & 0xff;
            l |= _decrypt[_off++] << 8 & 0xff00;
            l |= _decrypt[_off++] << 16 & 0xff0000;
            l |= _decrypt[_off++] << 24 & 0xff000000;
            l |= (long) _decrypt[_off++] << 32 & 0xff00000000L;
            l |= (long) _decrypt[_off++] << 40 & 0xff0000000000L;
            l |= (long) _decrypt[_off++] << 48 & 0xff000000000000L;
            l |= (long) _decrypt[_off++] << 56 & 0xff00000000000000L;
            return Double.longBitsToDouble(l);
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            // _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return 0D;
    }

    /**
     * @return short
     */
    protected int readH() {
        try {
            if (_decrypt == null) {
                return 0x00;
            }
            if (_decrypt.length < _off + 2) {
                return 0x00;
            }
            int i = _decrypt[_off++] & 0xff;
            i |= _decrypt[_off++] << 8 & 0xff00;
            return i;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
            // _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return 0x00;
    }

    /**
     * @return String
     */
    protected String readS() {
        String s = null;
        try {
            if (_decrypt == null) {
                return s;
            }
            s = new String(_decrypt, _off, _decrypt.length - _off, "UTF-8");
            s = s.substring(0, s.indexOf('\0'));
            _off += s.getBytes("UTF-8").length + 1;
        } catch (Exception e) {
            _log.log(Level.SEVERE, "OpCode=" + (_decrypt[0] & 0xff), e);
        }
        return s;
    }

    protected void finish() {
        try {
            _decrypt = null;
            _off = 0;
        } catch (final Exception e) {
            _log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        }
    }
}