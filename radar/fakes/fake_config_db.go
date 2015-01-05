// This file was generated by counterfeiter
package fakes

import (
	"sync"

	"github.com/concourse/atc"
	"github.com/concourse/atc/radar"
)

type FakeConfigDB struct {
	GetConfigStub        func() (atc.Config, error)
	getConfigMutex       sync.RWMutex
	getConfigArgsForCall []struct{}
	getConfigReturns     struct {
		result1 atc.Config
		result2 error
	}
	SaveConfigStub        func(atc.Config) error
	saveConfigMutex       sync.RWMutex
	saveConfigArgsForCall []struct {
		arg1 atc.Config
	}
	saveConfigReturns struct {
		result1 error
	}
}

func (fake *FakeConfigDB) GetConfig() (atc.Config, error) {
	fake.getConfigMutex.Lock()
	fake.getConfigArgsForCall = append(fake.getConfigArgsForCall, struct{}{})
	fake.getConfigMutex.Unlock()
	if fake.GetConfigStub != nil {
		return fake.GetConfigStub()
	} else {
		return fake.getConfigReturns.result1, fake.getConfigReturns.result2
	}
}

func (fake *FakeConfigDB) GetConfigCallCount() int {
	fake.getConfigMutex.RLock()
	defer fake.getConfigMutex.RUnlock()
	return len(fake.getConfigArgsForCall)
}

func (fake *FakeConfigDB) GetConfigReturns(result1 atc.Config, result2 error) {
	fake.GetConfigStub = nil
	fake.getConfigReturns = struct {
		result1 atc.Config
		result2 error
	}{result1, result2}
}

func (fake *FakeConfigDB) SaveConfig(arg1 atc.Config) error {
	fake.saveConfigMutex.Lock()
	fake.saveConfigArgsForCall = append(fake.saveConfigArgsForCall, struct {
		arg1 atc.Config
	}{arg1})
	fake.saveConfigMutex.Unlock()
	if fake.SaveConfigStub != nil {
		return fake.SaveConfigStub(arg1)
	} else {
		return fake.saveConfigReturns.result1
	}
}

func (fake *FakeConfigDB) SaveConfigCallCount() int {
	fake.saveConfigMutex.RLock()
	defer fake.saveConfigMutex.RUnlock()
	return len(fake.saveConfigArgsForCall)
}

func (fake *FakeConfigDB) SaveConfigArgsForCall(i int) atc.Config {
	fake.saveConfigMutex.RLock()
	defer fake.saveConfigMutex.RUnlock()
	return fake.saveConfigArgsForCall[i].arg1
}

func (fake *FakeConfigDB) SaveConfigReturns(result1 error) {
	fake.SaveConfigStub = nil
	fake.saveConfigReturns = struct {
		result1 error
	}{result1}
}

var _ radar.ConfigDB = new(FakeConfigDB)
