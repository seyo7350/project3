package sist.co.dao;

public interface HashDAO {
	
	public int getLastPeedSeq();
	public boolean insertHash(int peed_seq, String keyword);

}
