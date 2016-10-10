package sist.co.dao;

public interface HashDAO {
	
	public int getLastPeedSeq();
	public boolean insertHash(int peed_seq, String keyword);
	public int getHashSeq(String keyword);
	public int getPeedCount(int hash_seq);

}
