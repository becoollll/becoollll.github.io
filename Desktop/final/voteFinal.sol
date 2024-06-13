// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    address public owner;
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;
    uint public totalVotes;

    event Voted(address indexed voter, uint indexed candidateId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
        totalVotes = 0;
        addCandidate("POMPOMPURIN");
        addCandidate("BAD BADTZ-MARU");
        addCandidate("POCHACCO");
        addCandidate("HANGYODON");
        addCandidate("MY MELODY");
        addCandidate("CINNAMOROLL");
    }

    function addCandidate(string memory name) private onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }

    function vote(uint candidateId) public {
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID.");

        candidates[candidateId].voteCount++;
        totalVotes++;

        emit Voted(msg.sender, candidateId);
    }

    function getCandidate(uint candidateId) public view returns (uint, string memory, uint) {
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID.");
        Candidate memory candidate = candidates[candidateId];
        return (candidate.id, candidate.name, candidate.voteCount);
    }

    function getTotalVotes() public view returns (uint) {
        return totalVotes;
    }

    function getLeadingCandidate() public view returns (uint, string memory, uint) {
        uint leadingVoteCount = 0;
        uint leadingCandidateId = 0;

        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > leadingVoteCount) {
                leadingVoteCount = candidates[i].voteCount;
                leadingCandidateId = i;
            }
        }

        Candidate memory leadingCandidate = candidates[leadingCandidateId];
        return (leadingCandidate.id, leadingCandidate.name, leadingCandidate.voteCount);
    }
    function getSecondLeadingCandidate() public view returns (uint, string memory, uint) {
        uint leadingVoteCount = 0;
        uint secondLeadingVoteCount = 0;
        uint leadingCandidateId = 0;
        uint secondLeadingCandidateId = 0;

        for (uint i = 1; i <= candidatesCount; i++) {
            uint voteCount = candidates[i].voteCount;
            if (voteCount > leadingVoteCount) {
                secondLeadingVoteCount = leadingVoteCount;
                secondLeadingCandidateId = leadingCandidateId;
                leadingVoteCount = voteCount;
                leadingCandidateId = i;
            } else if (voteCount > secondLeadingVoteCount) {
                secondLeadingVoteCount = voteCount;
                secondLeadingCandidateId = i;
            }
        }

        Candidate memory secondLeadingCandidate = candidates[secondLeadingCandidateId];
        return (secondLeadingCandidate.id, secondLeadingCandidate.name, secondLeadingCandidate.voteCount);
    }



}
